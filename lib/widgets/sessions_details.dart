import 'package:ev_charging_app/models/sessions_data_map.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Listview showing charging session summary
class SessionsDetails extends StatelessWidget {
  const SessionsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sessionData.length,
      itemBuilder: (context, index) {
        final item = sessionData[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            // color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item["title"]!,
                      style: GoogleFonts.manrope(
                        textStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                      )),
                  const SizedBox(height: 4),
                  Text(
                    item["time"]!,
                    style: GoogleFonts.manrope(
                      textStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                  ),
                ],
              ),
              // Right Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(item["energy"]!,
                      style: GoogleFonts.manrope(
                        textStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                      )),
                  const SizedBox(height: 4),
                  Text(
                    item["duration"]!,
                    style: GoogleFonts.manrope(
                      textStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
