import 'package:ev_charging_app/core/color_constants.dart';
import 'package:ev_charging_app/core/constants.dart';
import 'package:ev_charging_app/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MilesScreen extends StatelessWidget {
  const MilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: MyCustomCliper(),
                    child: Container(
                        color: AppColorConstants.selectedItemColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '€158.00',
                                  style: GoogleFonts.manrope(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                Image.asset('lib/assets/app_icon.png')
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              AppConstants.availableSpent,
                              style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColorConstants.secondary300),
                            ),
                            const Spacer(),
                            Text(
                              AppConstants.earningMonth,
                              style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColorConstants.secondary300),
                            ),
                            Text(
                              '€156.00',
                              style: GoogleFonts.manrope(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )
                          ],
                        )),
                  ),
                  Positioned(
                    bottom: -5,
                    right: -10,
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: Center(
                          child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          AppConstants.requestText,
                          style: GoogleFonts.manrope(
                            textStyle:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      // color: Colors.white
                                    ),
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              //ListView for showing the transactions
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  transactions[index].title,
                                  style: GoogleFonts.manrope(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          // color: AppColorConstants.grey50
                                        ),
                                  ),
                                ),
                                Text(
                                  transactions[index].amount,
                                  style: GoogleFonts.manrope(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          // color: AppColorConstants.grey50
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  transactions[index].time,
                                  style: GoogleFonts.manrope(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          // color: AppColorConstants.grey50
                                        ),

                                    // color: AppColorConstants.grey400
                                  ),
                                ),
                                Text(
                                  transactions[index].power,
                                  style: GoogleFonts.manrope(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            // color: AppColorConstants.grey50
                                          ),
                                      color: AppColorConstants.grey400),
                                ),
                              ],
                            )
                          ],
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomCliper extends CustomClipper<Path> {
  double radius = 20;

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, radius)
      ..lineTo(0, size.height - radius)
      ..quadraticBezierTo(0, size.height, radius, size.height)
      ..lineTo(0.5 * size.width - radius / 2, size.height)
      ..quadraticBezierTo(0.5 * size.width, size.height, 0.5 * size.width,
          size.height - (radius / 2))
      ..lineTo(0.5 * size.width, size.height - 1.5 * radius)
      ..quadraticBezierTo(0.5 * size.width, size.height - (2 * radius),
          0.5 * size.width + (radius / 2), size.height - (2 * radius))
      ..lineTo(size.width - radius, size.height - (2 * radius))
      ..quadraticBezierTo(size.width, size.height - (2 * radius), size.width,
          size.height - (3 * radius))
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(radius, 0)
      ..quadraticBezierTo(0, 0, 0, radius)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
