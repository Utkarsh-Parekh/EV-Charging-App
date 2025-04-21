import 'package:ev_charging_app/core/color_constants.dart';
import 'package:ev_charging_app/core/constants.dart';
import 'package:ev_charging_app/models/sessions_data_map.dart';
import 'package:ev_charging_app/widgets/sessions_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppConstants.sessionsHeader,
          style: GoogleFonts.manrope(
            textStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        leading: const BackButton(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),

            //Toggle Button
            child: ToggleButtons(
              isSelected: List.generate(
                  sessionTabs.length, (index) => index == selectedIndex),
              onPressed: (index) {
                setState(() => selectedIndex = index);
              },
              borderRadius: BorderRadius.circular(12),
              fillColor: Theme.of(context).primaryColor,
              selectedColor: Colors.white,
              color: AppColorConstants.grey500,
              borderColor: Colors.transparent,
              disabledColor: Theme.of(context).disabledColor,
              // selectedBorderColor: AppColorConstants.grey700,
              constraints: const BoxConstraints(minHeight: 40, minWidth: 150),
              children: sessionTabs
                  .map(
                    (e) => Text(
                      e,
                      style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white, fontSize: 12)
                          // color: Theme.of(context).
                          // color: AppColorConstants.grey50
                          ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: selectedIndex == 0
                //Charging Summary widget
                ? SessionsDetails()
                : Center(
                    child: Text(
                      AppConstants.chargersNotAvailable,
                      style: GoogleFonts.manrope(
                        textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),

                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
