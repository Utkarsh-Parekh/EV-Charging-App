import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ev_charging_app/core/color_constants.dart';

class ChargingSummaryWidget extends StatelessWidget {
  final String chargingPercentage;
  final String chargingTime;
  final String address;
  final double chargingCost;

  const ChargingSummaryWidget({
    super.key,
    required this.chargingPercentage,
    required this.chargingTime,
    required this.address,
    required this.chargingCost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow("Charging", chargingPercentage),
          const SizedBox(height: 10),
          _infoRow("Time", chargingTime),
          const SizedBox(height: 10),
          _infoRow("Location", address),
          const SizedBox(height: 10),
          _infoRow("Cost", "€${chargingCost.toStringAsFixed(2)}"),
        ],
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColorConstants.grey100,
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColorConstants.primary200,
            ),
          ),
        ),
      ],
    );
  }
}
