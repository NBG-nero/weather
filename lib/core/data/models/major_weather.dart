// import 'dart:convert';

// import 'dart:convert';

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weath/core/data/models/coordinates.dart';
import 'package:weath/core/data/models/main_weather.dart';
import 'package:weath/core/data/models/wind.dart';

class MajorWeather {
  List<Weather>? weather;
  MainWeather? main;
  Wind? wind;
  String? name;

  MajorWeather({
    this.weather,
    this.main,
    this.wind,
    this.name,
  });

//   MajorWeather copyWith({
//     List<Weather>? weather,
//     MainWeather? main,
//     Wind? wind,
//     String? name,
//   }) {
//     return MajorWeather(
//       weather: weather ?? this.weather,
//       main: main ?? this.main,
//       wind: wind ?? this.wind,
//       name: name ?? this.name,
//     );
//   }

// // changed from toMap to toJson;
//   Map<String, dynamic> toJson() {
//     return {
//       'weather': weather?.map((x) => x.toJson()).toList(),
//       'main': main?.toJson(),
//       'wind': wind?.toJson(),
//       'name': name
//     };
//   }

// // changed from fromMap to fromJson;
//   factory MajorWeather.fromJson(Map<String, dynamic> map) {
//     return MajorWeather(
//       weather: map['weather'] != null
//           ? List<Weather>.from(map['weather']?.map((x) => Weather.fromJson(x)))
//           : null,
//       main: map['main'] != null ? MainWeather.fromJson(map['main']) : null,
//       wind: map['wind'] != null ? Wind.fromJson(map['wind']) : null,
//     );
//   }

//   // String toJson() => json.encode(toJson());

//   // factory MajorWeather.fromJson(String source) =>
//   //     MajorWeather.fromJson(json.decode(source));

//   @override
//   String toString() {
//     return 'MajorWeather(weather: $weather, main: $main, wind: $wind, name: $name)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is MajorWeather &&
//         listEquals(other.weather, weather) &&
//         other.main == main &&
//         other.wind == wind &&
//         other.name == name;
//   }

//   @override
//   int get hashCode {
//     return weather.hashCode ^ main.hashCode ^ wind.hashCode ^ name.hashCode;
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'weather': weather?.map((x) => x.toJson()).toList(),
//       'main': main?.toJson(),
//       'wind': wind?.toJson(),
//       'name': name,
//     };
//   }

//   factory MajorWeather.fromMap(Map<String, dynamic> map) {
//     return MajorWeather(
//       weather: map['weather'] != null
//           ? List<Weather>.from(map['weather']?.map((x) => Weather.fromJson(x)))
//           : null,
//       main: map['main'] != null ? MainWeather.fromJson(map['main']) : null,
//       wind: map['wind'] != null ? Wind.fromJson(map['wind']) : null,
//       name: map['name'],
//     );
//   }

//   // print(major);
//   // String toJson() => json.encode(toJson());

  // factory MajorWeather.fromJson(String source) => MajorWeather.fromJson(json.decode(source));

  MajorWeather copyWith({
    List<Weather>? weather,
    MainWeather? main,
    Wind? wind,
    String? name,
  }) {
    return MajorWeather(
      weather: weather ?? this.weather,
      main: main ?? this.main,
      wind: wind ?? this.wind,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weather': weather?.map((x) => x.toJson()).toList(),
      'main': main?.toJson(),
      'wind': wind?.toJson(),
      'name': name,
    };
  }

  factory MajorWeather.fromJson(Map<String, dynamic> map) {
    return MajorWeather(
      weather: map['weather'] != null ? List<Weather>.from(map['weather']?.map((x) => Weather.fromJson(x))) : null,
      main: map['main'] != null ? MainWeather.fromJson(map['main']) : null,
      wind: map['wind'] != null ? Wind.fromJson(map['wind']) : null,
      name: map['name'],
    );
  }

  String toJson(String s) => json.encode(toMap());

  // factory MajorWeather.fromJson(String source) => MajorWeather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MajorWeather(weather: $weather, main: $main, wind: $wind, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MajorWeather &&
      listEquals(other.weather, weather) &&
      other.main == main &&
      other.wind == wind &&
      other.name == name;
  }

  @override
  int get hashCode {
    return weather.hashCode ^
      main.hashCode ^
      wind.hashCode ^
      name.hashCode;
  }
}
