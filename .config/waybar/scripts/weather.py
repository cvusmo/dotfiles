#!/usr/bin/env python

import requests
from pyquery import PyQuery
import json

weather_icons = {
    "sunnyDay": "󰖨",
    "clearNight": "",
    "cloudyFoggyDay": "",
    "cloudyFoggyNight": "",
    "rainyDay": "",
    "rainyNight": "",
    "snowyIcyDay": "",
    "snowyIcyNight": "",
    "severe": "󰼯",
    "default": "",
}

# go to weather.com and enter city/state/country for location, paste the information
location_id = "6acb34a6274390e11a1e7e3badbbbf3c60ced28b0e79d97af240f0e05244419e"

url = "https://weather.com/en-IN/weather/today/l/" + location_id
headers = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
}
response = requests.get(url, headers=headers)
html_data = PyQuery(response.text)

temp = html_data("span[data-testid='TemperatureValue']").eq(0).text() or "N/A"

status = html_data("div[data-testid='wxPhrase']").text() or "Unknown"
status = f"{status[:16]}.." if len(status) > 17 else status

region_header = html_data("#regionHeader").attr("class")
if region_header:
    try:
        status_code = region_header.split(" ")[2].split("-")[2]
    except (IndexError, AttributeError):
        status_code = "default"
else:
    status_code = "default"

icon = weather_icons.get(status_code, weather_icons["default"])

temp_feel = (
    html_data(
        "div[data-testid='FeelsLikeSection'] > span[data-testid='TemperatureValue']"
    ).text()
    or "N/A"
)
temp_feel_text = f"Feels like {temp_feel}c"

temp_min = (
    html_data("div[data-testid='wxData'] > span[data-testid='TemperatureValue']")
    .eq(0)
    .text()
) or "N/A"
temp_max = (
    html_data("div[data-testid='wxData'] > span[data-testid='TemperatureValue']")
    .eq(1)
    .text()
) or "N/A"
temp_min_max = f"  {temp_min}\t\t  {temp_max}"

wind_data = html_data("span[data-testid='Wind']").text()
wind_speed = wind_data.split("\n")[1] if len(wind_data.split("\n")) > 1 else "N/A"
wind_text = f"煮  {wind_speed}"

humidity = html_data("span[data-testid='PercentageValue']").text() or "N/A"
humidity_text = f"  {humidity}"

visbility = html_data("span[data-testid='VisibilityValue']").text() or "N/A"
visbility_text = f"  {visbility}"

air_quality_index = html_data("text[data-testid='DonutChartValue']").text() or "N/A"

prediction = (
    html_data("section[aria-label='Hourly Forecast']")(
        "div[data-testid='SegmentPrecipPercentage'] > span"
    ).text()
    or ""
)
prediction = prediction.replace("Chance of Rain", "")
prediction = f"\n\n    (hourly) {prediction}" if len(prediction) > 0 else prediction

tooltip_text = str.format(
    "\t\t{}\t\t\n{}\n{}\n{}\n\n{}\n{}\n{}{}",
    f'<span size="xx-large">{temp}</span>',
    f"<big>{icon}</big>",
    f"<big>{status}</big>",
    f"<small>{temp_feel_text}</small>",
    f"<big>{temp_min_max}</big>",
    f"{wind_text}\t{humidity_text}",
    f"{visbility_text}\tAQI {air_quality_index}",
    f"<i>{prediction}</i>",
)

out_data = {
    "text": f"{icon}   {temp}",
    "alt": status,
    "tooltip": tooltip_text,
    "class": status_code,
}
print(json.dumps(out_data))
