import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/home_screen.dart';
import 'package:flutter_weather_app/res/app_strings.dart';
import 'package:flutter_weather_app/theme/color_theme.dart';
import 'package:flutter_weather_app/weather_screen/bloc/weather_bloc.dart';

import 'data/networks/repository.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(repository: WeatherRepositoryImpl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: AppColors.lightFon2,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
