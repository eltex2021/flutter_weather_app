import 'dart:convert';
import 'package:flutter_weather_app/data/networks/models/weather_model2.dart';
import 'package:http/http.dart' as http;

import 'models/weather_model.dart';
//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

abstract class WeatherRepository {
  Future<WeatherModel> getWeather(String city);
}

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<WeatherModel> getWeather(String city) async {
    final response = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=${city}&&appid=772b8897f596755b3dac7bac53909f88"));

    if (response.statusCode == 200) {
      //print("тест 2 репозиторий");

      WeatherModel myWeather =
          WeatherModel.fromJson(json.decode(response.body));

      // print("тест 3 репозиторий");

      //print(city);

      return myWeather;
    } else {
      throw Exception('Ошибка загрузки');
    }
  }
}
