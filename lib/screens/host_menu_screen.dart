import 'package:ev_charging_app/core/color_constants.dart';
import 'package:ev_charging_app/core/constants.dart';
import 'package:ev_charging_app/providers/auth_provider.dart';
import 'package:ev_charging_app/widgets/button_widget.dart';
import 'package:ev_charging_app/widgets/chips_choice_widget.dart';
import 'package:ev_charging_app/widgets/host_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HostMenuScreen extends StatelessWidget {
  const HostMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.notifications_outlined,
                    // color: Colors.white,
                  )),
              const SizedBox(
                height: 20,
              ),
              Consumer<AuthProvider>(
                builder: (BuildContext context, authprovider, Widget? child) =>
                    Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(16),

                  //User Profile and Email
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              authprovider.userPhotoUrl.toString(),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                authprovider!.userName.toString(),
                                style: GoogleFonts.manrope(
                                  textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),

                                    // color: AppColorConstants.grey50
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                authprovider!.userEmail.toString(),
                                style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: AppColorConstants.grey500
                                ),
                              )
                            ],
                          ),
                        ],
                      ),

                      //Host Chips
                      const ChipsChoiceWidget(
                        containerColor: AppColorConstants.grey400,
                        text: 'Host',
                        textColor: AppColorConstants.primary600,
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              Text(
                AppConstants.generalText,
                style: GoogleFonts.manrope(
                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: 0.2,
                  ),

                  // color: AppColorConstants.grey400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //GENERAL
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).canvasColor,
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              // color: AppColorConstants.grey200,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppConstants.accountSettingsText,
                              style: GoogleFonts.manrope(
                                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.2,
                                ),

                                // color: AppColorConstants.grey200,
                              ),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColorConstants.grey500,
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 1,
                        color: AppColorConstants.grey500,
                      ),
                    ),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'lib/assets/chargers.png',
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                                // color:
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                AppConstants.chargerHeader,
                                style: GoogleFonts.manrope(
                                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    letterSpacing: 0.2,
                                  ),

                                  // color: AppColorConstants.grey200,
                                ),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColorConstants.grey500,
                          )
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              Text(
                AppConstants.supportText,
                style: GoogleFonts.manrope(
                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: 0.2,
                  ),
                  // color: AppColorConstants.grey400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //support
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).canvasColor,
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.help_outline,
                              // color: AppColorConstants.grey200,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppConstants.helpText,
                              style: GoogleFonts.manrope(
                                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  letterSpacing: 0.2,
                                ),

                                // color: AppColorConstants.grey200,
                              ),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColorConstants.grey500,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              //Switch EV Widget
              const HostMenuWidget(
                imageIcon: 'lib/assets/switch.png',
                text: 'Switch to EV User',
              ),

              const SizedBox(
                height: 20,
              ),

              //Sign Out Button
              Consumer<AuthProvider>(
                builder: (BuildContext context, authprovider, Widget? child) {
                  return ButtonWidget(
                    icon: 'lib/assets/logout.png',
                    buttontext: 'Log Out',
                    onTap: () {
                      authprovider.signOut();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
