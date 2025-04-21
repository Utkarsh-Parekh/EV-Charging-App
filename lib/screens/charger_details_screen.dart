import 'package:ev_charging_app/core/color_constants.dart';
import 'package:ev_charging_app/models/charger_states.dart';
import 'package:ev_charging_app/providers/charger_provider.dart';
import 'package:ev_charging_app/screens/charging_car_screen.dart';
import 'package:ev_charging_app/widgets/button_widget.dart';
import 'package:ev_charging_app/widgets/charger_description_details.dart';
import 'package:ev_charging_app/widgets/chips_choice_widget.dart';
import 'package:ev_charging_app/widgets/gridview_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChargerDetailsScreen extends StatelessWidget {
  const ChargerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the selected charger using Provider
    final charger = Provider.of<ChargerProvider>(context).selectedCharger;

    if (charger == null) {
      return Scaffold(
        appBar: AppBar(title: Text(charger!.chargerID)),
        body: const Center(child: Text('No charger selected')),
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          charger.chargerID,
          style: GoogleFonts.manrope(
            textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                charger.fullImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),

              Text(
                charger.title,
                style: GoogleFonts.manrope(
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),

              ChargerDescriptionDetails(
                icon: Icons.location_on,
                data: charger.address,
                // textColor: AppColorConstants.grey200,
                // iconColor: AppColorConstants.grey200,
              ),

              charger.status != 'Available'
                  ? ChargerDescriptionDetails(
                      // textColor: AppColorConstants.grey200,
                      // iconColor: AppColorConstants.grey200,
                      icon: Icons.access_time_filled,
                      data: charger.avability)
                  : Container(),

              Row(
                children: [
                  ChargerDescriptionDetails(
                    // textColor: AppColorConstants.grey200,
                    // iconColor: AppColorConstants.grey200,
                    icon: Icons.battery_charging_full,
                    data: charger.type,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 6,
                    children: [
                      ChipsChoiceWidget(
                          text: charger.status,
                          containerColor: charger.status == 'Available'
                              ? AppColorConstants.success600
                              : AppColorConstants.warning600,
                          textColor: AppColorConstants.grey900),
                      // more...
                    ],
                  ),
                ],
              ),

              Text(
                charger.price,
                style: GoogleFonts.manrope(
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 20,
                      // color: AppColorConstants.grey50,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              const Divider(
                thickness: 1,
                color: AppColorConstants.grey700,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'My Stats',
                style: GoogleFonts.manrope(
                  textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        // color: AppColorConstants.grey50
                      ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              //Reusable Grid Component
              GridViewContainerWidget(
                crossAxisCount: 2,
                items: chargerStates.take(2).toList(),
              ),
              const SizedBox(
                height: 30,
              ),

              //Reusable Button Widget
              ButtonWidget(
                isIconVisible: false,
                icon: '',
                buttontext: charger.status == 'Available'
                    ? 'Start Charging'
                    : 'Charge Here',
                onTap: () {
                  charger.status == 'Available'
                      ? Get.to(() => const ChargingCarScreen())
                      : null;
                },
              )
              // Add other information as needed
            ],
          ),
        ),
      ),
    );
  }
}
