part of 'weather_bloc.dart';



abstract class WeatherState {}

//Инициализация
class InitialWeatherState extends WeatherState {}


//Загрузка данных
class LoadingWeatherState extends WeatherState {
 //final WeatherElement myWeather;
 //final List<WeatherElement> myWeather;
  //final Main myWeather;
  final WeatherModel myWeather;

  LoadingWeatherState({required this.myWeather});
}

//Ошибка
class ErrorPostsState extends WeatherState {}
