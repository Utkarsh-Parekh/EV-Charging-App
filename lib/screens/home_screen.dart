import 'package:ev_charging_app/core/color_constants.dart';
import 'package:ev_charging_app/core/constants.dart';
import 'package:ev_charging_app/models/home_screen_details_map.dart';
import 'package:ev_charging_app/widgets/chips_choice_widget.dart';
import 'package:ev_charging_app/widgets/gridview_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        statusBarIconBrightness: Brightness.light, // light icons for dark bg
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome Benny ✨',
          style: GoogleFonts.manrope(
              textStyle: Theme.of(context).textTheme.bodyLarge,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        actions:  [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications_outlined,
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Home Card
            Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppConstants.homeChargerTitle,
                              style: GoogleFonts.manrope(
                                textStyle: Theme.of(context).textTheme.titleLarge,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                              ),
                            ),
                            const Icon(
                              Icons.settings,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          AppConstants.homeChargerAddress,
                          style: GoogleFonts.manrope(
                            textStyle: Theme.of(context).textTheme.bodySmall,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppConstants.homeChargerType,
                              style: GoogleFonts.manrope(
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,

                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ChipsChoiceWidget(
                                  containerColor: AppColorConstants.warning600,
                                  textColor: AppColorConstants.primary600,
                                  text: 'Charging',
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )),

            const SizedBox(
              height: 50,
            ),

            //Reusable Grid Widget
            GridViewContainerWidget(
              crossAxisCount: 2,
              items: homeDetails.take(4).toList(),
            )
          ],
        ),
      ),
    );
  }
}
