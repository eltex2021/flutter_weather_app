import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/components/scaffold_messenger_snackbar.dart';
import 'package:flutter_weather_app/theme/color_theme.dart';
import 'package:flutter_weather_app/weather_screen/bloc/weather_bloc.dart';
import 'package:flutter_weather_app/weather_screen/weather_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightFon2,
      body: BodyWidget(cityController: _cityController),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required TextEditingController cityController,
  })  : _cityController = cityController,
        super(key: key);

  final TextEditingController _cityController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Введите название города на Английском языке"),
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
              hintText: "Moscow",
              isDense: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherScreen(_cityController.text),
                  ),
                );
                BlocProvider.of<WeatherBloc>(context)
                    .add(InitialWeatherEvent(city: _cityController.text));


                ScaffoldMessenger.of(context)
                    .showSnackBar(AppSnackBar.forCnackBar);
              },
              child: const Text("Подтвердить выбор")),
        ],
      ),
    );
  }
}
