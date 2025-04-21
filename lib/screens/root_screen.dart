import 'package:ev_charging_app/core/color_constants.dart';
import 'package:ev_charging_app/screens/chargers_screen.dart';
import 'package:ev_charging_app/screens/home_screen.dart';
import 'package:ev_charging_app/screens/host_menu_screen.dart';
import 'package:ev_charging_app/screens/miles_screen.dart';
import 'package:ev_charging_app/screens/sessions_screen.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<RootScreen> {
  var currentIndex = 0;

  //List Of Pages
  final List<Widget> _pages = [
    const HomeScreen(),
    const SessionsScreen(),
    const ChargersScreen(),
    const MilesScreen(),
    const HostMenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).canvasColor,
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(0, 2),
              )
            ],
          ),
          height: 100,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset('lib/assets/home.png',
                      height: 24,
                      width: 24,
                      color: currentIndex == 0
                          ? AppColorConstants.selectedItemColor
                          : AppColorConstants.grey200
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'lib/assets/sessions_icon.png',
                    height: 24,
                    width: 24,
                    color: currentIndex == 1
                        ? AppColorConstants.selectedItemColor
                        : AppColorConstants.grey200,
                  ),
                  label: "Sessions"),
              BottomNavigationBarItem(
                  icon: Image.asset('lib/assets/chargers.png',
                      height: 24,
                      width: 24,
                      color: currentIndex == 2
                          ? AppColorConstants.selectedItemColor
                          : AppColorConstants.grey200),
                  label: "Chargers"),
              BottomNavigationBarItem(
                  icon: Image.asset('lib/assets/wallet_icon.png',
                      height: 24,
                      width: 24,
                      color: currentIndex == 3
                          ? AppColorConstants.selectedItemColor
                          : AppColorConstants.grey200),
                  label: "C.Miles"),
              BottomNavigationBarItem(
                  icon: Image.asset('lib/assets/menu_icon.png',
                      height: 24,
                      width: 24,
                      color: currentIndex == 4
                          ? AppColorConstants.selectedItemColor
                          : AppColorConstants.grey200),
                  label: "Menu"),
            ],
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: _pages[currentIndex]
        ));
  }
}
