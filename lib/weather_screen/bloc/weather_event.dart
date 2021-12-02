part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class InitialWeatherEvent extends WeatherEvent {
  final String city;

  InitialWeatherEvent({required this.city,});
}
