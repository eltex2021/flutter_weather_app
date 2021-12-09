import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/components/scaffold_messenger_snackbar.dart';
import 'package:flutter_weather_app/data/networks/models/weather_model2.dart';
import 'package:flutter_weather_app/res/app_strings.dart';
import 'package:flutter_weather_app/theme/color_theme.dart';
import 'package:flutter_weather_app/theme/text_theme.dart';
import 'bloc/weather_bloc.dart';

// ignore: must_be_immutable
class WeatherScreen extends StatelessWidget {
  WeatherModel? myWeather;

  WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightFon2,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppColors.lightFon2,
        title: const Text(AppStrings.otherCity, style: AppTexsts.mainBlack15),
      ),
      body: BlocListener<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is ErrorWeatherState) {
            //print("проверка вывода SnackBar");
            ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.forSnackBar);
          }
        },
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is InitialWeatherState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoadingWeatherState) {
              myWeather = state.myWeather;
              return Stack(
                children: [
                  weatherImageFon(context),
                  weatherInfoContainer(context),
                ],
              );
            }
            return const Center(child: Text(AppStrings.error));
          },
        ),
      ),
    );
  }

  //Изображение с типом погоды для фона
  Column weatherImageFon(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2 + 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(getWeatherImage()), fit: BoxFit.cover)),
        ),
      ],
    );
  }

  //основная информация о погоде
  Container weatherInfoContainer(BuildContext context) {
    String idImage = myWeather!.weather[0].icon;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightFon2,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  myWeather!.name.toString(),
                  style: AppTexsts.welcome,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 7,
                ),
                SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                        "http://openweathermap.org/img/wn/${idImage}@2x.png")),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            AppStrings.temp + (myWeather!.main.temp.round()).toString() + " °C",
            style: AppTexsts.mainBlack15,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppStrings.humidity + myWeather!.main.humidity.toString() + " %",
            style: AppTexsts.mainBlack15,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppStrings.windSpeed + myWeather!.wind.speed.toString() + " м/с",
            style: AppTexsts.mainBlack15,
          ),
          const SizedBox(
            height: 20,
          ),
          //Image.network("http://openweathermap.org/img/wn/01d@2x.png"),
        ],
      ),
    );
  }

  //метод для вывода изображения в зависимости от типа погоды
  String getWeatherImage() {
    String typeWeather = "";
    if (myWeather?.weather[0].main == "Clear") {
      typeWeather = "assets/images/clear.png";
    } else if (myWeather?.weather[0].main == "Drizzle") {
      typeWeather = "assets/images/drizzle.png";
    } else if (myWeather?.weather[0].main == "Rain") {
      typeWeather = "assets/images/rain.png";
    } else if (myWeather?.weather[0].main == "Snow") {
      typeWeather = "assets/images/snow.png";
    } else if (myWeather?.weather[0].main == "Clouds") {
      typeWeather = "assets/images/clouds.png";
    } else if (myWeather?.main.toString() == "thunderstorm") {
      typeWeather = "assets/images/thundr.png";
    } else {
      typeWeather = "assets/images/sun.png";
    }
    return typeWeather;
  }
}
