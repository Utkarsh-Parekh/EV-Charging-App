import 'package:ev_charging_app/core/themes/app_theme.dart';
import 'package:ev_charging_app/firebase_options.dart';
import 'package:ev_charging_app/providers/auth_provider.dart';
import 'package:ev_charging_app/providers/charger_provider.dart';
import 'package:ev_charging_app/providers/theme_provider.dart';
import 'package:ev_charging_app/screens/root_screen.dart';
import 'package:ev_charging_app/screens/user_onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [

        //Auth Provider
        ChangeNotifierProvider<AuthProvider>(create: (context) {
          return AuthProvider();
        }),

        //Theme Provider
        ChangeNotifierProvider<ThemeProvider>(create: (context) {
          return ThemeProvider();
        }),

        //Charger Provider
        ChangeNotifierProvider<ChargerProvider>(create: (context) {
          return ChargerProvider();
        })
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, themeProvider, Widget? child) =>
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        home: Consumer<AuthProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return value.isLoggedIn ? const RootScreen() : const UserOnboarding();
          },
        ),
      ),
    );
  }
}
