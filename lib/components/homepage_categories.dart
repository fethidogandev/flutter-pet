import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class HomepageCategories extends StatelessWidget {
  final void Function() onTap;
  final Image imageData;
  final String category;
  final Color? backgroundColor;

  const HomepageCategories(
      {super.key,
      required this.onTap,
      required this.imageData,
      required this.category,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 74,
            width: 74,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                color: primaryPurpleColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(200),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(200), child: imageData),
          ),
        ),
        SizedBox(height: 4),
        Text(
          category,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            color: primaryTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
