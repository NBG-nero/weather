import 'package:flutter/widgets.dart';
import 'package:weath/core/data/models/error_model.dart';
import 'package:weath/core/data/models/major_weather.dart';
import 'package:weath/core/data/models/success_model.dart';
import 'package:weath/core/data/dataProviders/services/weather_service.dart';
import 'package:weath/core/misc/extras/customtoast.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class WeatherProvider extends ChangeNotifier {
  final WeatherService service = WeatherService();
  MajorWeather? major = MajorWeather();
  bool loading = false;
  // var value = 0;
  List<AssetImage> images = <AssetImage>[];

  randomImage() {
    images.add(const AssetImage('assets/images/bg2.jpg'));
    images.add(const AssetImage('assets/images/bg3.jpg'));
    images.add(const AssetImage('assets/images/bg4.jpg'));
    images.add(const AssetImage('assets/images/bg5.jpg'));
    images.add(const AssetImage('assets/images/bg6.jpg'));
    images.add(const AssetImage('assets/images/bg7.jpg'));
    images.add(const AssetImage('assets/images/bg8.jpg'));
    images.add(const AssetImage('assets/images/bg9.jpg'));
    // notifyListeners();
  }

  getWeather(String city, context) async {
    final result = await service.getWeatherData(city);
    if (result is ErrorModel) {
      showErrorToast('Incorrect city name');
      setLoading(false);
    } else if (result is SuccessModel) {
      setLoading(true);
      major = result.data;
      setLoading(false);
      Navigator.of(context).pushNamed('w');

      // print(major!.main!.feels_like);
      // print(major?.name);
      notifyListeners();
    }
  }
  



  AssetImage selectRandomImage(List<AssetImage> images) {
    Random rnd;
    int min = 0;
    int max = 8;
    rnd = Random();
    var r = min + rnd.nextInt(max - min);
    return images[r];
  }

  setLoading(value) {
    loading = value;
    notifyListeners();
  }

  getProgress(dynamic value) {
    return value / 100;
  }

  Color getProgressColor(dynamic value) {
    switch (value) {
      case '12':
        return Colors.green;
      case '19':
        return Colors.blue;
      default:
        return Colors.red;
    }

    // if (value == 12) {
    //   return Colors.green;
    // } else {
    //   return Colors.red;
    // }
  }
}
