import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimalInfos extends StatelessWidget {
  final Image? image;
  final String infoText;
  final Color textColor;
  const AnimalInfos({
    super.key,
    required this.image,
    required this.infoText,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: image),
        const SizedBox(width: 10),
        Text(infoText,
            style: GoogleFonts.montserrat(
                fontSize: 16.5, color: textColor, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
