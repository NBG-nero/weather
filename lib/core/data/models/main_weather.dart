// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
// import 'package:weath/core/logic/utils/utils.dart';

part 'main_weather.g.dart';

@JsonSerializable()
class MainWeather {
  MainWeather({
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.humidity,
  });

  factory MainWeather.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherFromJson(json);

  dynamic feels_like;
  // int? a = feels_like.toInt();
  dynamic humidity;
  dynamic pressure;
  dynamic temp;
  dynamic temp_max;
  dynamic temp_min;

  Map<String, dynamic> toJson() => _$MainWeatherToJson(this);


}
