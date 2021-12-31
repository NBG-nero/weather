import 'package:weath/core/data/models/error_model.dart';
import 'package:weath/core/data/models/major_weather.dart';
import 'package:weath/core/data/models/success_model.dart';
import 'package:weath/core/data/dataProviders/services/index.dart';

class WeatherService {
  getWeatherData(String city) async {
    final result = await http
        .get("/weather?q=$city&appid=378266570b207e15d0cac817f0e498eb");
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    }
    if (result is SuccessModel) {
      MajorWeather mj = MajorWeather.fromJson(result.data);
      return SuccessModel(mj);
    }
  }
}
