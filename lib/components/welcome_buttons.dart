import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeButtons extends StatelessWidget {
  final Color mainColor;
  final Image iconImage;
  final String buttonText;
  final void Function() onTap;
  const WelcomeButtons(
      {super.key,
      required this.mainColor,
      required this.iconImage,
      required this.buttonText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 370,
        height: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: mainColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(children: [
            iconImage,
            const SizedBox(width: 15),
            Text(buttonText,
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    letterSpacing: 0.6,
                    color: mainColor,
                    fontWeight: FontWeight.w600)),
          ]),
        ),
      ),
    );
  }
}
