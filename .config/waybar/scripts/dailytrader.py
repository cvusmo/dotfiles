#!/usr/bin/env python

import requests
import json
import os
import re
import sys
from datetime import datetime

# Load API KEY
secrets_file = os.path.expanduser("~/.secrets")
API_KEY = None
try:
    with open(secrets_file, "r") as f:
        for line in f:
            line = line.strip()
            if line.startswith("FINNHUB_KEY"):
                match = re.match(r'FINNHUB_KEY\s*=\s*["\']?([^"\']+)["\']?', line)
                if match:
                    API_KEY = match.group(1)
                    break
        if not API_KEY:
            raise ValueError("FINNHUB_KEY not found in ~/.secrets")
except Exception as e:
    print(f"Error loading API key: {e}", file=sys.stderr)
    API_KEY = None

# Load stock list
stocks_file = os.path.expanduser("~/.stocks")
symbols = []
try:
    with open(stocks_file, "r") as f:
        for line in f:
            symbol = line.strip().upper()
            if symbol and not symbol.startswith("#"):
                symbols.append(symbol)
except Exception as e:
    print(f"Error loading stock list: {e}", file=sys.stderr)
    symbols = ["LCID", "GNPX"]


# Fetch from Finnhub
def fetch_stock_data(symbol):
    if not API_KEY:
        print("No API key available", file=sys.stderr)
        return None, None, None
    url = f"https://finnhub.io/api/v1/quote?symbol={symbol}&token={API_KEY}"
    try:
        response = requests.get(url, params={"token": API_KEY})
        response.raise_for_status()
        data = response.json()
        if "error" in data:
            print(f"API error for {symbol}: {data.get('error')}", file=sys.stderr)
            return None, None, None
        current_price = data.get("c")
        change = data.get("d", 0)
        percent_change = data.get("dp", 0)
        if current_price is None or current_price == 0:
            print(f"No valid data for {symbol}", file=sys.stderr)
            return None, None, None
        return current_price, change, percent_change
    except requests.exceptions.HTTPError as e:
        print(
            f"HTTP error for {symbol}: {e.response.status_code} - {e.response.text}",
            file=sys.stderr,
        )
        return None, None, None
    except Exception as e:
        print(f"Error fetching data for {symbol}: {e}", file=sys.stderr)
        return None, None, None


# Data
gain_icon = "󰔵"
loss_icon = "󰔳"
stock_data = {}
tooltip_lines = []

last_checked = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
tooltip_lines.append(f"<b>Last checked: {last_checked}</b>\n")

for symbol in symbols:
    price, change, pct = fetch_stock_data(symbol)
    if price is not None:
        formatted_pct = f"{pct:+.2f}%"
        if pct >= 0:
            color = "green"
            icon = gain_icon
        else:
            color = "red"
            icon = loss_icon

        # Main bar text
        colored_part = f"<span foreground='{color}'>{icon} {formatted_pct}</span>"
        text = f"{symbol}: {colored_part}"

        # Tooltip entry
        tooltip_symbol = (
            f"<b>{symbol}</b>\n"
            f"Price: <span foreground='{color}'>${price:.2f}</span>\n"
            f"Change: <span foreground='{color}'>{icon} {change:+.2f} ({formatted_pct})</span>"
        )

        stock_data[symbol] = {"text": text, "tooltip": tooltip_symbol}
        tooltip_lines.append(tooltip_symbol)
    else:
        stock_data[symbol] = {
            "text": f"{symbol}: N/A",
            "tooltip": f"<b>{symbol}</b>\n<span foreground='gray'>Data unavailable</span>",
        }
        tooltip_lines.append(stock_data[symbol]["tooltip"])

combined_text = " | ".join([data["text"] for data in stock_data.values()])
combined_tooltip = "\n\n".join(tooltip_lines)

out_data = {
    "text": combined_text,
    "tooltip": combined_tooltip,
    "class": "stocks",
}

print(json.dumps(out_data))
