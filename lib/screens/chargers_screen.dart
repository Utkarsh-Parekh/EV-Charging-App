import 'package:ev_charging_app/core/constants.dart';
import 'package:ev_charging_app/models/charger_details_model.dart';
import 'package:ev_charging_app/widgets/button_widget.dart';
import 'package:ev_charging_app/widgets/charger_details_widget.dart';
import 'package:flutter/material.dart';

//Charger Screen : Index2
class ChargersScreen extends StatelessWidget {
  const ChargersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppConstants.chargerHeader,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {}),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //List of Chargers
                    ChargerListWidget(chargers: chargers),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ButtonWidget(
              icon: 'lib/assets/logout.png',
              buttontext: AppConstants.addChargerText,
              onTap: () {
                // Handle button tap here
              },
            ),
          ),
        ],
      ),
    );
  }
}
