import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:weath/core/data/dataProviders/providers/weather_provider.dart';
import 'package:weath/core/data/models/major_weather.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIcon {
  MajorWeather? major = MajorWeather();

  Icon getweathercon(String val) {
    switch (val) {
      case "Clouds":
        return const Icon(WeatherIcons.cloudy, color: Colors.white);

      case "Clear":
        // return const  Icon(WeatherIcons.day_haze,color: Colors.white,);
        return const Icon(WeatherIcons.day_light_wind, color: Colors.white);

      case "Rain":
        return const Icon(WeatherIcons.rain, color: Colors.white);

      case "Sunny":
        return const Icon(WeatherIcons.day_sunny, color: Colors.white);

      case "Fog":
        return const Icon(
          WeatherIcons.fog,
          color: Colors.white,
        );

      case "Mist":
        return const Icon(
          WeatherIcons.day_haze,
          color: Colors.white,
        );
      case "Snow":
        return const Icon(WeatherIcons.snow,color: Colors.white);
      default:
        return const Icon(WeatherIcons.sunrise, color: Colors.white);
    }
  }
}
