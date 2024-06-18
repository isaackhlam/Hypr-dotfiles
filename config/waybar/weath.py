#!/usr/bin/env python

import json
import requests
from datetime import datetime

WEATHER_CODES = {
    '113': '', # \ue30d Sunny
    '116': '', # \ue302 Partly Cloudy
    '119': '', # \ue312 Cloudy
    '122': '', # \ue312 Very Cloudy
    '143': '', # \ue313 Fog
    '176': '', # \ue309 Light Shower
    '179': '', # \ue3ad Light Sleet Shower
    '182': '', # \ue3ad Light Sleet
    '185': '', # \ue3ad Light Sleet
    '200': '', # \ue31c Thundery Shower
    '227': '', # \ue35e Light Snow
    '230': '', # \ue36f Heavy Snow
    '248': '', # \ue313 Fog
    '260': '', # \ue313 Fog
    '263': '', # \ue309 Light Shower
    '266': '', # \ue309 Light Rain
    '281': '', # \ue3ad Light Sleet
    '284': '', # \ue3ad Light Sleet
    '293': '', # \ue309 Light Rain
    '296': '', # \ue309 Light Rain
    '299': '', # \ue316 Heavy Shower
    '302': '', # \ue316 Heavy Rain
    '305': '', # \ue316 Heavy Shower
    '308': '', # \ue316 Heavy Rain
    '311': '', # \ue3ad Light Sleet
    '314': '', # \ue3ad Light Sleet
    '317': '', # \ue3ad Light Sleet
    '320': '', # \ue35e Light Snow
    '323': '', # \ue35e Light Snow Shower
    '326': '', # \ue35e Light Snow Shower
    '329': '', # \ue36f Heavy Snow
    '332': '', # \ue36f Heavy Snow
    '335': '', # \ue36f Heavy Snow Shower
    '338': '', # \ue36f Heavy Snow
    '350': '', # \ue3ad Light Sleet
    '353': '', # \ue309 Light Shower
    '356': '', # \ue316 Heavy Shower
    '359': '', # \ue316 Heavy Rain
    '362': '', # \ue3ad Light Sleet Shower
    '365': '', # \ue3ad Light Sleet Shower
    '368': '', # \ue35e Light Snow Shower
    '371': '', # \ue36f Heavy Snow Shower
    '374': '', # \ue3ad Light Sleet Shower
    '377': '', # \ue3ad Light Sleet
    '386': '', # \ue31c Thundery Shower
    '389': '', # \ue31d Thunder Heavy Rain
    '392': '', # \ue365 Thunder Snow Showers
    '395': '', # \ue36f Heavy Snow Shower
}

data = {}


weather = requests.get("https://wttr.in/?format=j1").json()


def format_time(time):
    return time.replace("00", "").zfill(2)


def format_temp(temp):
    return (hour['FeelsLikeC']+"°").ljust(3)


def format_chances(hour):
    chances = {
        "chanceoffog": "Fog",
        "chanceoffrost": "Frost",
        "chanceofovercast": "Overcast",
        "chanceofrain": "Rain",
        "chanceofsnow": "Snow",
        "chanceofsunshine": "Sunshine",
        "chanceofthunder": "Thunder",
        "chanceofwindy": "Wind"
    }

    conditions = []
    for event in chances.keys():
        if int(hour[event]) > 0:
            conditions.append(chances[event]+" "+hour[event]+"%")
    return ", ".join(conditions)


data['text'] = WEATHER_CODES[weather['current_condition'][0]['weatherCode']] + \
    " " + weather['current_condition'][0]['temp_C'] + \
    "(" + weather['current_condition'][0]['FeelsLikeC'] + ") °C"

data['tooltip'] = f"<b>{weather['current_condition'][0]['weatherDesc'][0]['value']} {weather['current_condition'][0]['temp_C']}°</b>\n"
data['tooltip'] += f"Feels like: {weather['current_condition'][0]['FeelsLikeC']}°\n"
data['tooltip'] += f"Wind: {weather['current_condition'][0]['windspeedKmph']}Km/h\n"
data['tooltip'] += f"Humidity: {weather['current_condition'][0]['humidity']}%\n"
for i, day in enumerate(weather['weather']):
    data['tooltip'] += f"\n<b>"
    if i == 0:
        data['tooltip'] += "Today, "
    if i == 1:
        data['tooltip'] += "Tomorrow, "
    data['tooltip'] += f"{day['date']}</b>\n"
    data['tooltip'] += f"󰁝 {day['maxtempC']}° 󰁅 {day['mintempC']}° "
    data['tooltip'] += f" {day['astronomy'][0]['sunrise']}  {day['astronomy'][0]['sunset']}\n"
    for hour in day['hourly']:
        if i == 0:
            if int(format_time(hour['time'])) < datetime.now().hour-2:
                continue
        data['tooltip'] += f"{format_time(hour['time'])} {WEATHER_CODES[hour['weatherCode']]} {format_temp(hour['FeelsLikeC'])} {hour['weatherDesc'][0]['value']}, {format_chances(hour)}\n"


print(json.dumps(data))
