
import 'package:ev_charging_app/core/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChargerDescriptionDetails extends StatelessWidget {
  final String? image;
  final IconData? icon;
  final String data;
  // final Color iconColor;
  // final Color textColor;
  final bool isIconAvailable;

  const ChargerDescriptionDetails(
      {super.key,
      this.image,
      required this.data,
      this.icon,
      this.isIconAvailable = true,
        // required this.iconColor,
        // required this.textColor
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          isIconAvailable
              ? Icon(
                  icon,
                  // color: iconColor
                )
              : Image.asset(
                  image!,
                  // color: iconColor,
                ),
          const SizedBox(
            width: 8,
          ),
          Text(
            data!,
            style: GoogleFonts.manrope(
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: 0.2,
                // color: AppColorConstants.grey50
              ),

              // color: textColor
            ),
          ),

        ],
      ),
    );
  }
}
