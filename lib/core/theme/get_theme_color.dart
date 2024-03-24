/// Function to get theme color based on brightness
import 'package:flutter/material.dart';

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'clear':
      return Colors.blue;
    case 'patchy snow possible':
    case 'patchy rain possible':
    case 'patchy sleet possible':
    case 'partly cloudy':
    case 'patchy freezing drizzle possible':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'ice pellets':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    case 'cloudy':
      return Colors.blueGrey;
    case 'overcast':
    case 'blowing snow':
    case 'mist':
    case 'blizzard':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.indigo;
    default:
      return Colors.blue;
  }
}
