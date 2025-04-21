import 'package:flutter/material.dart';


//Provides theme preference
class ThemeProvider extends ChangeNotifier{

  ThemeMode _themeData = ThemeMode.dark;

  get themedata => _themeData;

  //Can be used to provide apps specific dark/light mode
  void toggleTheme(bool isDarkMode){
    _themeData = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}