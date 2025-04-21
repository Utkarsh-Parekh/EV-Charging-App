import 'package:ev_charging_app/core/color_constants.dart';
import 'package:flutter/material.dart';

class CustomAppBarTheme{

  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    backgroundColor: AppColorConstants.lightScaffold
  );
  static AppBarTheme darkAppBarTheme = const AppBarTheme(
      backgroundColor: AppColorConstants.grey900
  );

}