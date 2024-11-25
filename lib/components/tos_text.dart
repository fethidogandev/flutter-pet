import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class TosText extends StatelessWidget {
  final String text;
  const TosText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: GoogleFonts.montserrat(
          fontSize: 16, color: primaryTextColor, fontWeight: FontWeight.w500),
    );
  }
}
