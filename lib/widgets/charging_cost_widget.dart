import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ev_charging_app/core/color_constants.dart';

class ChargingCostWidget extends StatelessWidget {
  final double chargingCost;
  final double idleCost;

  const ChargingCostWidget({
    super.key,
    required this.chargingCost,
    required this.idleCost,
  });

  @override
  Widget build(BuildContext context) {
    double total = chargingCost + idleCost;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCostRow("Charging Cost", chargingCost, context),
        const SizedBox(height: 10),
        _buildCostRow("Idle Cost", idleCost, context),
        const SizedBox(height: 10),
        _buildCostRow("Total", total, context, isTotal: true),
      ],
    );
  }

  Widget _buildCostRow(String title, double amount, BuildContext context, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: isTotal ? 24 : 16,
            fontWeight: FontWeight.w700,
            // color: AppColorConstants.grey100,
          ),
        ),
        Text(
          "€${amount.toStringAsFixed(2)}",
          style: GoogleFonts.manrope(
            fontSize: isTotal ? 24 : 16,
            fontWeight: FontWeight.w700,
            // color: AppColorConstants.primary200,
          ),
        ),
      ],
    );
  }
}
