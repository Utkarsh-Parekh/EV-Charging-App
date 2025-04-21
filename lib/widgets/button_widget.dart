import 'package:ev_charging_app/core/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String? buttontext;
  final String? icon;
  final bool isIconVisible;
  final void Function()? onTap;

  const ButtonWidget(
      {super.key,
      this.buttontext,
      this.icon,
      this.isIconVisible = true,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
                visible: isIconVisible,
                child: Image.asset(
                  icon!,
                  color: AppColorConstants.primary600,
                )),
            const SizedBox(
              width: 10,
            ),
            Text(
              buttontext!,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.2,
                color: AppColorConstants.primary600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
