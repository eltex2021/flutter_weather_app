import 'package:flutter/material.dart';
import 'package:flutter_weather_app/theme/text_theme.dart';


abstract class AppSnackBar {
  static var forCnackBar = SnackBar(
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      width: 230,
      backgroundColor: Colors.grey[800]!.withOpacity(0.8),
      duration: const Duration(milliseconds: 2000),
      content: const Text(
        "Ошибка получения данных",
        textAlign: TextAlign.center,
        style: AppTexsts.mainWhite15,
      ));



}
