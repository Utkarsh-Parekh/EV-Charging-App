import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChipsChoiceWidget extends StatelessWidget {
  final Color? containerColor;
  final Color? textColor;
  final String? text;
  const ChipsChoiceWidget({super.key, this.containerColor, this.textColor, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(50)
      ),
      child: Text(
        text!,
        style: GoogleFonts.manrope(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: textColor
        ),
      ),
    );

  }
}
