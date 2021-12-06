import 'package:flutter/material.dart';
import 'package:flutter_weather_app/res/app_strings.dart';
import 'package:flutter_weather_app/theme/text_theme.dart';

abstract class AppSnackBar {
  static var forSnackBar = SnackBar(
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(left: 60, right: 60, bottom: 350),
      backgroundColor: Colors.grey[800]!.withOpacity(0.8),
      duration: const Duration(milliseconds: 2500),
      content: const Text(
        AppStrings.error,
        textAlign: TextAlign.center,
        style: AppTexsts.mainWhite15,
      ));
}
