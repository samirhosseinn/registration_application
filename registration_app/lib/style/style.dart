import 'package:flutter/material.dart';
import 'package:registration_app/Responsive/size_config.dart';

class AppTheme {
  AppTheme._();

  static Color primaryLightColor = const Color(0xFF0165ff);
  static Color primaryDarkColor = const Color.fromARGB(255, 10, 36, 81);

  static String primaryFontFamily = "Oceanwide";

  // -------------------------  whiteText --------------------------------
  static var whiteText = TextTheme(
    headline1: _headline1White,
    headline2: _headline2White,
    headline3: _headline3White,
    headline4: _headline4White,
    headline5: _headline5White,
    headline6: _headline6White,
    button: _buttonWhite,
    subtitle1: _subtitle1White,
    subtitle2: _subtitle2White,
  );
  static final TextStyle _headline1White = TextStyle(
    color: Colors.white,
    fontFamily: primaryFontFamily,
    fontSize: 5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline2White = TextStyle(
    color: Colors.white,
    fontFamily: primaryFontFamily,
    fontSize: 4.75 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline3White = TextStyle(
    color: Colors.white,
    fontFamily: primaryFontFamily,
    fontSize: 4.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline4White = TextStyle(
    color: Colors.white,
    fontFamily: primaryFontFamily,
    fontSize: 4 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline5White = TextStyle(
    color: Colors.white,
    fontFamily: primaryFontFamily,
    fontSize: 3.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline6White = TextStyle(
    color: Colors.white,
    fontFamily: primaryFontFamily,
    fontSize: 3 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _buttonWhite = TextStyle(
    color: Colors.white,
    fontFamily: primaryFontFamily,
    fontSize: 2.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle1White = TextStyle(
    color: Colors.white,
    fontFamily: primaryFontFamily,
    fontSize: 2 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle2White = TextStyle(
    color: Colors.white,
    fontFamily: primaryFontFamily,
    fontSize: 1.5 * SizeConfig.textMultiplier!,
  );
  // -------------------------  whiteText --------------------------------

  // -------------------------  BlackText --------------------------------
  static var blackText = TextTheme(
    headline1: _headline1Black,
    headline2: _headline2Black,
    headline3: _headline3Black,
    headline4: _headline4Black,
    headline5: _headline5Black,
    headline6: _headline6Black,
    button: _buttonBlack,
    subtitle1: _subtitle1Black,
    subtitle2: _subtitle2Black,
  );
  static final TextStyle _headline1Black = TextStyle(
    color: Colors.black,
    fontFamily: primaryFontFamily,
    fontSize: 5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline2Black = TextStyle(
    color: Colors.black,
    fontFamily: primaryFontFamily,
    fontSize: 4.75 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline3Black = TextStyle(
    color: Colors.black,
    fontFamily: primaryFontFamily,
    fontSize: 4.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline4Black = TextStyle(
    color: Colors.black,
    fontFamily: primaryFontFamily,
    fontSize: 4 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline5Black = TextStyle(
    color: Colors.black,
    fontFamily: primaryFontFamily,
    fontSize: 3.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline6Black = TextStyle(
    color: Colors.black,
    fontFamily: primaryFontFamily,
    fontSize: 3 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _buttonBlack = TextStyle(
    color: Colors.black,
    fontFamily: primaryFontFamily,
    fontSize: 2.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle1Black = TextStyle(
    color: Colors.black,
    fontFamily: primaryFontFamily,
    fontSize: 2 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle2Black = TextStyle(
    color: Colors.black,
    fontFamily: primaryFontFamily,
    fontSize: 1.5 * SizeConfig.textMultiplier!,
  );
  // -------------------------  BlackText --------------------------------

  // -------------------------  GreyText --------------------------------
  static var greyText = TextTheme(
    headline1: _headline1Grey,
    headline2: _headline2Grey,
    headline3: _headline3Grey,
    headline4: _headline4Grey,
    headline5: _headline5Grey,
    headline6: _headline6Grey,
    button: _buttonGrey,
    subtitle1: _subtitle1Grey,
    subtitle2: _subtitle2Grey,
  );
  static final TextStyle _headline1Grey = TextStyle(
    color: Colors.grey,
    fontFamily: primaryFontFamily,
    fontSize: 5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline2Grey = TextStyle(
    color: Colors.grey,
    fontFamily: primaryFontFamily,
    fontSize: 4.75 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline3Grey = TextStyle(
    color: Colors.grey,
    fontFamily: primaryFontFamily,
    fontSize: 4.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline4Grey = TextStyle(
    color: Colors.grey,
    fontFamily: primaryFontFamily,
    fontSize: 4 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline5Grey = TextStyle(
    color: Colors.grey,
    fontFamily: primaryFontFamily,
    fontSize: 3.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline6Grey = TextStyle(
    color: Colors.grey,
    fontFamily: primaryFontFamily,
    fontSize: 3 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _buttonGrey = TextStyle(
    color: Colors.grey,
    fontFamily: primaryFontFamily,
    fontSize: 2.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle1Grey = TextStyle(
    color: Colors.grey,
    fontFamily: primaryFontFamily,
    fontSize: 2 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle2Grey = TextStyle(
    color: Colors.grey,
    fontFamily: primaryFontFamily,
    fontSize: 1.5 * SizeConfig.textMultiplier!,
  );
  // -------------------------  GreyText --------------------------------

  // -------------------------  RedText --------------------------------
  static var redText = TextTheme(
    headline1: _headline1Red,
    headline2: _headline2Red,
    headline3: _headline3Red,
    headline4: _headline4Red,
    headline5: _headline5Red,
    headline6: _headline6Red,
    button: _buttonRed,
    subtitle1: _subtitle1Red,
    subtitle2: _subtitle2Red,
  );
  static final TextStyle _headline1Red = TextStyle(
    color: Colors.red,
    fontFamily: primaryFontFamily,
    fontSize: 5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline2Red = TextStyle(
    color: Colors.red,
    fontFamily: primaryFontFamily,
    fontSize: 4.75 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline3Red = TextStyle(
    color: Colors.red,
    fontFamily: primaryFontFamily,
    fontSize: 4.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline4Red = TextStyle(
    color: Colors.red,
    fontFamily: primaryFontFamily,
    fontSize: 4 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline5Red = TextStyle(
    color: Colors.red,
    fontFamily: primaryFontFamily,
    fontSize: 3.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline6Red = TextStyle(
    color: Colors.red,
    fontFamily: primaryFontFamily,
    fontSize: 3 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _buttonRed = TextStyle(
    color: Colors.red,
    fontFamily: primaryFontFamily,
    fontSize: 2.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle1Red = TextStyle(
    color: Colors.red,
    fontFamily: primaryFontFamily,
    fontSize: 2 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle2Red = TextStyle(
    color: Colors.red,
    fontFamily: primaryFontFamily,
    fontSize: 1.5 * SizeConfig.textMultiplier!,
  );
  // -------------------------  RedText --------------------------------

  // -------------------------  RedText --------------------------------
  static var blueText = TextTheme(
    headline1: _headline1Blue,
    headline2: _headline2Blue,
    headline3: _headline3Blue,
    headline4: _headline4Blue,
    headline5: _headline5Blue,
    headline6: _headline6Blue,
    button: _buttonBlue,
    subtitle1: _subtitle1Blue,
    subtitle2: _subtitle2Blue,
  );
  static final TextStyle _headline1Blue = TextStyle(
    color: Colors.blue,
    fontFamily: primaryFontFamily,
    fontSize: 5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline2Blue = TextStyle(
    color: Colors.blue,
    fontFamily: primaryFontFamily,
    fontSize: 4.75 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline3Blue = TextStyle(
    color: Colors.blue,
    fontFamily: primaryFontFamily,
    fontSize: 4.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline4Blue = TextStyle(
    color: Colors.blue,
    fontFamily: primaryFontFamily,
    fontSize: 4 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline5Blue = TextStyle(
    color: Colors.blue,
    fontFamily: primaryFontFamily,
    fontSize: 3.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline6Blue = TextStyle(
    color: Colors.blue,
    fontFamily: primaryFontFamily,
    fontSize: 3 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _buttonBlue = TextStyle(
    color: Colors.blue,
    fontFamily: primaryFontFamily,
    fontSize: 2.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle1Blue = TextStyle(
    color: Colors.blue,
    fontFamily: primaryFontFamily,
    fontSize: 2 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle2Blue = TextStyle(
    color: Colors.blue,
    fontFamily: primaryFontFamily,
    fontSize: 1.5 * SizeConfig.textMultiplier!,
  );
  // -------------------------  RedText --------------------------------

// -------------------------  lightPrimaryText --------------------------------
  static var lightPrimaryText = TextTheme(
    headline1: _headline1LightPrimary,
    headline2: _headline2LightPrimary,
    headline3: _headline3LightPrimary,
    headline4: _headline4LightPrimary,
    headline5: _headline5LightPrimary,
    headline6: _headline6LightPrimary,
    button: _buttonLightPrimary,
    subtitle1: _subtitle1LightPrimary,
    subtitle2: _subtitle2LightPrimary,
  );
  static final TextStyle _headline1LightPrimary = TextStyle(
    color: primaryLightColor,
    fontFamily: primaryFontFamily,
    fontSize: 5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline2LightPrimary = TextStyle(
    color: primaryLightColor,
    fontFamily: primaryFontFamily,
    fontSize: 4.75 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline3LightPrimary = TextStyle(
    color: primaryLightColor,
    fontFamily: primaryFontFamily,
    fontSize: 4.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline4LightPrimary = TextStyle(
    color: primaryLightColor,
    fontFamily: primaryFontFamily,
    fontSize: 4 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline5LightPrimary = TextStyle(
    color: primaryLightColor,
    fontFamily: primaryFontFamily,
    fontSize: 3.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline6LightPrimary = TextStyle(
    color: primaryLightColor,
    fontFamily: primaryFontFamily,
    fontSize: 3 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _buttonLightPrimary = TextStyle(
    color: primaryLightColor,
    fontFamily: primaryFontFamily,
    fontSize: 2.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle1LightPrimary = TextStyle(
    color: primaryLightColor,
    fontFamily: primaryFontFamily,
    fontSize: 2 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle2LightPrimary = TextStyle(
    color: primaryLightColor,
    fontFamily: primaryFontFamily,
    fontSize: 1.5 * SizeConfig.textMultiplier!,
  );
  // -------------------------  lightPrimaryText --------------------------------

  // -------------------------  DarkPrimaryText --------------------------------
  static var darkPrimaryText = TextTheme(
    headline1: _headline1DarkPrimary,
    headline2: _headline2DarkPrimary,
    headline3: _headline3DarkPrimary,
    headline4: _headline4DarkPrimary,
    headline5: _headline5DarkPrimary,
    headline6: _headline6DarkPrimary,
    button: _buttonDarkPrimary,
    subtitle1: _subtitle1DarkPrimary,
    subtitle2: _subtitle2DarkPrimary,
  );
  static final TextStyle _headline1DarkPrimary = TextStyle(
    color: primaryDarkColor,
    fontFamily: primaryFontFamily,
    fontSize: 5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline2DarkPrimary = TextStyle(
    color: primaryDarkColor,
    fontFamily: primaryFontFamily,
    fontSize: 4.75 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline3DarkPrimary = TextStyle(
    color: primaryDarkColor,
    fontFamily: primaryFontFamily,
    fontSize: 4.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline4DarkPrimary = TextStyle(
    color: primaryDarkColor,
    fontFamily: primaryFontFamily,
    fontSize: 4 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline5DarkPrimary = TextStyle(
    color: primaryDarkColor,
    fontFamily: primaryFontFamily,
    fontSize: 3.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _headline6DarkPrimary = TextStyle(
    color: primaryDarkColor,
    fontFamily: primaryFontFamily,
    fontSize: 3 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _buttonDarkPrimary = TextStyle(
    color: primaryDarkColor,
    fontFamily: primaryFontFamily,
    fontSize: 2.5 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle1DarkPrimary = TextStyle(
    color: primaryDarkColor,
    fontFamily: primaryFontFamily,
    fontSize: 2 * SizeConfig.textMultiplier!,
  );
  static final TextStyle _subtitle2DarkPrimary = TextStyle(
    color: primaryDarkColor,
    fontFamily: primaryFontFamily,
    fontSize: 1.5 * SizeConfig.textMultiplier!,
  );
  // -------------------------  DarkPrimaryText --------------------------------

}
