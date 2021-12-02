import 'package:flutter/material.dart';

import 'color_theme.dart';

abstract class AppTexsts {
  static const welcome = TextStyle(
    color: AppColors.blueMain,
    fontSize: 30,
    letterSpacing: 0.5,
    height: 1.176,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  static const mainBlack15 = TextStyle(
    color: Colors.black,
    fontSize: 15,
    letterSpacing: 0.5,
    height: 1.176,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  static const mainWhite15 = TextStyle(
    color: Colors.white,
    fontSize: 15,
    letterSpacing: 0.5,
    height: 1.176,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );


}
