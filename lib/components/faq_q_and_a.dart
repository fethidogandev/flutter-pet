import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class FaqQandA extends StatelessWidget {
  final String question;
  final String answer;
  const FaqQandA({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          question,
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
              fontSize: 18,
              color: primaryPurpleColor,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Text(
          answer,
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(
              fontSize: 16,
              color: primaryTextColor,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
