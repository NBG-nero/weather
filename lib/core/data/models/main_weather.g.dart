// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainWeather _$MainWeatherFromJson(Map<String, dynamic> json) => MainWeather(
      temp: json['temp']as dynamic,
      feels_like: json['feels_like'] as dynamic,
      temp_min: json['temp_min']as dynamic,
      temp_max: json['temp_max'] as dynamic,
      pressure: json['pressure'] as dynamic,
      humidity: json['humidity'] as dynamic,
    );

Map<String, dynamic> _$MainWeatherToJson(MainWeather instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
