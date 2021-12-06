import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/components/scaffold_messenger_snackbar.dart';
import 'package:flutter_weather_app/res/app_strings.dart';
import 'package:flutter_weather_app/theme/color_theme.dart';
import 'package:flutter_weather_app/theme/text_theme.dart';
import 'package:flutter_weather_app/weather_screen/bloc/weather_bloc.dart';
import 'package:flutter_weather_app/weather_screen/weather_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightFon2,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(AppStrings.enterCityName, style: AppTexsts.mainBlack15,),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _cityController,
                keyboardType: TextInputType.name,
                maxLines: 1,
                textCapitalization: TextCapitalization.words,
                autocorrect: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: AppStrings.hintText,
                  isDense: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    navigateToNextScreen(context);
                    addInitialEvent(context);
                  },
                  child: const Text(AppStrings.confirmSelection)),
            ],
          ),
        ));
  }

  //метод для добавления в bloc события с названием города
  void addInitialEvent(context) {
    BlocProvider.of<WeatherBloc>(context)
        .add(InitialWeatherEvent(city: _cityController.text));
  }

  //метод для перехода на экран с показом погоды
  void navigateToNextScreen(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherScreen(),
      ),
    );
  }
}
