part of 'weather_bloc.dart';

abstract class WeatherState {}

//Инициализация
class InitialWeatherState extends WeatherState {}

//Загрузка данных
class LoadingWeatherState extends WeatherState {
  final WeatherModel myWeather;

  LoadingWeatherState({required this.myWeather});
}

//Ошибка
class ErrorWeatherState extends WeatherState {}
