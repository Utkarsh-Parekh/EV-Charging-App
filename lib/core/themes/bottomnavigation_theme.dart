import 'package:ev_charging_app/core/color_constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationTheme{


  static BottomNavigationBarThemeData lightBottomNavigationTheme = const BottomNavigationBarThemeData(
      backgroundColor: AppColorConstants.lightScaffold,
      unselectedItemColor: AppColorConstants.light100,
      selectedItemColor: AppColorConstants.selectedItemColor
  );

  static BottomNavigationBarThemeData darkBottomNavigationTheme =  const BottomNavigationBarThemeData(
      backgroundColor:AppColorConstants.grey900,
      unselectedItemColor: AppColorConstants.grey400,
      selectedItemColor:AppColorConstants.selectedItemColor
  );
}