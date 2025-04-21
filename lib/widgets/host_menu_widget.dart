import 'package:ev_charging_app/core/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HostMenuWidget extends StatelessWidget {
  final String? imageIcon;
  final String? text;
  const HostMenuWidget({super.key, this.imageIcon, this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
            color: Theme.of(context).canvasColor,width: 2
        )
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageIcon!, color:Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black, ),
          const SizedBox(
            width: 10,
          ),
          Text(text!,style: GoogleFonts.manrope(
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.2,
            ),

            // color: AppColorConstants.grey200,
          ),),
        ],
      ),
    );
  }
}
