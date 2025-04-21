import 'package:ev_charging_app/core/color_constants.dart';
import 'package:ev_charging_app/core/constants.dart';
import 'package:ev_charging_app/providers/charger_provider.dart';
import 'package:ev_charging_app/widgets/button_widget.dart';
import 'package:ev_charging_app/widgets/charger_description_details.dart';
import 'package:ev_charging_app/widgets/charging_cost_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

//Charging Progress Screen
class ChargingCarScreen extends StatelessWidget {
  const ChargingCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          leading: IconButton(
            // color: Colors.white,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppConstants.chargingText,
                        style: GoogleFonts.manrope(
                          textStyle:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('lib/assets/battery.svg'),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset('lib/assets/lighting.svg'),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            charger.chargingPercentage,
                            style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: AppColorConstants.success600),
                          )
                        ],
                      ),
                      Text(
                        "${charger.chargingTime} remain",
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          color: AppColorConstants.grey400,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Image.asset('lib/assets/charging_car_image.png'),
                ],
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
              Center(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.manrope(
                        fontSize: 68,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                        color: AppColorConstants.success600),
                    children: [
                      TextSpan(text: charger.chargingKwh),
                      TextSpan(
                        text: 'kWh',
                        style: GoogleFonts.manrope(
                            fontSize: 38,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                            color: AppColorConstants.success600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
                color: AppColorConstants.grey700,
              ),
              const SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    charger.title,
                    style: GoogleFonts.manrope(
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 28, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "€ 00.00/kWh",
                    style: GoogleFonts.manrope(
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),

              //Reusable component
              ChargerDescriptionDetails(
                icon: Icons.location_on,
                data: charger.address,
                // textColor: AppColorConstants.grey400,
                // iconColor: AppColorConstants.grey400,
              ),

              Row(
                children: [
                  ChargerDescriptionDetails(
                    image: 'lib/assets/CCS2.png',
                    // textColor: AppColorConstants.grey200,
                    // iconColor: AppColorConstants.grey200,
                    data: charger.type,
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              const Divider(
                thickness: 1,
                color: AppColorConstants.grey700,
              ),
              const SizedBox(
                height: 30,
              ),

              //Reusable Charging Cost Widget
              ChargingCostWidget(
                chargingCost: charger.cost,
                idleCost: 00.00,
              ),

              const SizedBox(
                height: 30,
              ),

              //Reusable Button Widget
              ButtonWidget(
                isIconVisible: false,
                icon: '',
                buttontext: 'Stop Charging',
                onTap: () {},
              )
              // Add other information as needed
            ],
          ),
        ),
      ),
    );
  }
}
