import 'package:ev_charging_app/core/color_constants.dart';
import 'package:ev_charging_app/core/themes/appbar_theme.dart';
import 'package:ev_charging_app/core/themes/bottomnavigation_theme.dart';
import 'package:ev_charging_app/core/themes/icon_theme.dart';
import 'package:ev_charging_app/core/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppThemes {

  //Light Theme
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColorConstants.primarylight,
      secondaryHeaderColor: AppColorConstants.green300,
      canvasColor: AppColorConstants.green100,
      scaffoldBackgroundColor:AppColorConstants.lightScaffold,
       textTheme: CustomTextTheme.lightTextTheme,
      appBarTheme: CustomAppBarTheme.lightAppBarTheme,
      cardColor: AppColorConstants.grey700,
      primaryColorDark: AppColorConstants.green100,
      disabledColor: Colors.black54,
      bottomNavigationBarTheme:
          CustomBottomNavigationTheme.lightBottomNavigationTheme,

      iconTheme: CustomIconTheme.lightIconTheme,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple.shade100,
          foregroundColor: Colors.black));



  //Dark Theme
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColorConstants.backgroundColor,
      canvasColor: AppColorConstants.grey800,
    primaryColorDark: AppColorConstants.grey100,
      secondaryHeaderColor: AppColorConstants.grey500,
      scaffoldBackgroundColor: AppColorConstants.grey900,
      textTheme: CustomTextTheme.darkTextTheme,
    iconTheme: CustomIconTheme.darkIconTheme,
      cardColor: AppColorConstants.grey700,
    disabledColor: AppColorConstants.grey800,
      appBarTheme: CustomAppBarTheme.darkAppBarTheme,

      bottomNavigationBarTheme:
          CustomBottomNavigationTheme.darkBottomNavigationTheme,
     );
}
