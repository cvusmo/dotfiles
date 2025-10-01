#!/usr/bin/env python

import requests
import json
import os
import re
import sys

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

# Stocks track
symbols = ["LCID", "GNPX"]


# Fetch from Finnhub
def fetch_stock_data(symbols_list):
    if not API_KEY:
        print("No API key available", file=sys.stderr)
        return {}
    symbols_str = ",".join(symbols_list)
    url = f"https://finnhub.io/api/v1/quote?symbol={symbols_str}&token={API_KEY}"
    try:
        response = requests.get(url, params={"token": API_KEY})
        response.raise_for_status()  # Raise error
        data = response.json()
        if not isinstance(data, dict):
            print(f"API error: Invalid response format", file=sys.stderr)
            return {}
        stock_dict = {}
        for symbol in symbols_list:
            if symbol in data:
                quote = data[symbol]
                current_price = quote.get("c")  # Current price
                previous_close = quote.get("pc")  # Previous close
                change = quote.get("d", 0)  # Day change
                percent_change = quote.get("dp", 0)  # Day % change
                if current_price is not None:
                    stock_dict[symbol] = (current_price, change, percent_change)
                else:
                    print(f"No valid data for {symbol}", file=sys.stderr)
            else:
                print(f"No data for {symbol}", file=sys.stderr)
        return stock_dict
    except requests.exceptions.HTTPError as e:
        print(
            f"HTTP error: {e.response.status_code} - {e.response.text}", file=sys.stderr
        )
        return {}
    except Exception as e:
        print(f"Error fetching data: {e}", file=sys.stderr)
        return {}


# Icons for gain/loss
gain_icon = "󰔵"  # Green
loss_icon = "󰔳"  # Red

# Fetch data for all stocks in one call
stock_info = fetch_stock_data(symbols)

# Process data
stock_data = {}
for symbol in symbols:
    if symbol in stock_info:
        price, change, pct = stock_info[symbol]
        formatted_pct = f"{pct:+.2f}%"
        if pct >= 0:
            color = "green"
            icon = gain_icon
        else:
            color = "red"
            icon = loss_icon
        colored_part = f"<span foreground='{color}'>{icon} {formatted_pct}</span>"
        text = f"{symbol}: {colored_part}"
        tooltip = (
            f"{symbol} Price: ${price:.2f}\nChange: ${change:+.2f} ({formatted_pct})"
        )
        stock_data[symbol] = {"text": text, "tooltip": tooltip}
    else:
        stock_data[symbol] = {
            "text": f"{symbol}: N/A",
            "tooltip": f"{symbol}: Data unavailable",
        }

combined_text = " | ".join([data["text"] for data in stock_data.values()])
combined_tooltip = "\n".join(
    [f"<b>{symbol}</b>\n{data['tooltip']}" for symbol, data in stock_data.items()]
)

out_data = {
    "text": combined_text,
    "tooltip": combined_tooltip,
    "class": "stocks",
}

print(json.dumps(out_data))
