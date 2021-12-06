import 'dart:convert';
import 'package:flutter_weather_app/data/networks/models/weather_model2.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRepository {
  Future<WeatherModel> getWeather(String city);
}

class WeatherRepositoryImpl implements WeatherRepository {
  //возможность смены языка ввода
  String lang = "ru";

  //возможность смены стандарта отображения едениц измерения
  //по умолчанию идет стандарт, metric - метрическая система отображения
  String units = "metric";

  @override
  Future<WeatherModel> getWeather(String city) async {
    final response = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=${city}&&appid=.........................&lang={lang}&units=${units}"));

    if (response.statusCode == 200) {
      //print("тест 2 репозиторий");

      WeatherModel myWeather =
          WeatherModel.fromJson(json.decode(response.body));

      // print("тест 3 репозиторий");

      return myWeather;
    } else {
      throw Exception('Ошибка загрузки');
    }
  }
}
