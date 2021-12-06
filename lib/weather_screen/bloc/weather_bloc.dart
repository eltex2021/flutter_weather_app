import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/components/scaffold_messenger_snackbar.dart';
import 'package:flutter_weather_app/data/networks/models/weather_model.dart';
import 'package:flutter_weather_app/data/networks/models/weather_model2.dart';
import 'package:flutter_weather_app/data/networks/repository.dart';

import '../../main.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository repository;

  WeatherBloc({required this.repository}) : super(InitialWeatherState());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is InitialWeatherEvent) {
      //print("ждем ");
      yield InitialWeatherState();
      try {
        //пробуем загрузить данные

        final WeatherModel weather = await repository.getWeather(event.city);

        yield LoadingWeatherState(myWeather: weather);
      } catch (_) {
        yield ErrorWeatherState();
        //print("Ошибка ErrorState");
      }
    }
  }
}
