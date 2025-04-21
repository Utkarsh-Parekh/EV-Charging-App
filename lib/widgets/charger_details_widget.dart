// widgets/charger_list_widget.dart

import 'package:ev_charging_app/models/charger_details_model.dart';
import 'package:ev_charging_app/providers/charger_provider.dart';
import 'package:ev_charging_app/screens/charger_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../core/color_constants.dart';
import 'chips_choice_widget.dart';

class ChargerListWidget extends StatelessWidget {
  final List<ChargerModel> chargers;

  const ChargerListWidget({Key? key, required this.chargers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chargers.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // parent will scroll
      itemBuilder: (context, index) {
        final charger = chargers[index];

        return GestureDetector(
          onTap: () {
            //Notify the Details screen with selected charger
            Provider.of<ChargerProvider>(context, listen: false)
                .selectCharger(charger);
            Get.to(() => const ChargerDetailsScreen());
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Theme.of(context).canvasColor, // changes with theme
            ),
            child: Row(
              children: [
                Image.asset(
                  charger.imageUrl,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            charger.title,
                            style: GoogleFonts.manrope(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                          const Icon(Icons.settings),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        charger.address,
                        style: GoogleFonts.manrope(
                          textStyle:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        charger.price,
                        style: GoogleFonts.manrope(
                          textStyle:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            charger.type,
                            style: GoogleFonts.manrope(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                          ChipsChoiceWidget(
                            containerColor: charger.statusColor,
                            textColor: AppColorConstants.primary600,
                            text: charger.status,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
