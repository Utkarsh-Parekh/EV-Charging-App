import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridViewContainerWidget extends StatelessWidget {
  final int crossAxisCount;
  final List<Map<String, dynamic>> items;

  const GridViewContainerWidget(
      {super.key, required this.crossAxisCount, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: items.map((item) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (item['icon'] != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Image.asset(
                        item['icon'],
                        height: 24,
                        width: 24,
                        color: Theme.of(context).iconTheme.color
                      ),
                    ),
                  Text(item["value"],
                      style: GoogleFonts.manrope(
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              Spacer(),
              Text(item["title"],
                  style: GoogleFonts.manrope(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),)
            ],
          ),
        );
      }).toList(),
    );
  }
}
