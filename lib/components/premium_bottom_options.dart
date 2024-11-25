import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class PremiumBottomOptions extends StatelessWidget {
  final String description;
  const PremiumBottomOptions({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Icon(
            Icons.check,
            size: 30,
            color: primaryPurpleColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(description,
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: primaryPurpleColor,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
