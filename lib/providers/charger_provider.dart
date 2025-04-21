
import 'package:ev_charging_app/models/charger_details_model.dart';
import 'package:flutter/material.dart';

//Chargerprovider to pass data on Chargers Selection
class ChargerProvider with ChangeNotifier {
  ChargerModel? _selectedCharger;

  ChargerModel? get selectedCharger => _selectedCharger;

  // Set the charger information when selected
  void selectCharger(ChargerModel charger) {
    _selectedCharger = charger;
    notifyListeners();
  }
}
