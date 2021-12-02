import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/data/networks/models/weather_model2.dart';
import 'package:flutter_weather_app/theme/color_theme.dart';
import 'package:flutter_weather_app/theme/text_theme.dart';
import 'bloc/weather_bloc.dart';

class WeatherScreen extends StatelessWidget {
  final String cityName;
  WeatherModel? myWeather;

  WeatherScreen(this.cityName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is InitialWeatherState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadingWeatherState) {
          //print("LoadingWeatherState");
          myWeather = state.myWeather;

          return Scaffold(
            backgroundColor: AppColors.lightFon2,
            appBar: AppBar(
              title: const Text("Выбрать другой город"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    myWeather!.name.toString(),
                    style: AppTexsts.welcome,
                  )),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Температура " +
                        ((myWeather!.main.temp - 273.15).round()).toString() +
                        " °C",
                    style: AppTexsts.mainBlack15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Влажность " + myWeather!.main.humidity.toString() + " %",
                    style: AppTexsts.mainBlack15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Скорость ветра " +
                        myWeather!.wind.speed.toString() +
                        " м/с",
                    style: AppTexsts.mainBlack15,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        }
        return const ErrorWidget();
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightFon2,
      appBar: AppBar(
        title: const Text("Вернутся на главный экран"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(child: Text("Ошибка получения данных")),
          ],
        ),
      ),
    );
  }
}

