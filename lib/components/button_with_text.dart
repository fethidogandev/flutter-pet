import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class ButtonWithText extends StatelessWidget {
  final void Function() buttonFunc;
  final String buttonName;
  const ButtonWithText(
      {super.key, required this.buttonFunc, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunc,
      child: Container(
        width: 370,
        height: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: primaryPurpleColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(buttonName,
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    letterSpacing: 2.5,
                    color: primaryPurpleColor,
                    fontWeight: FontWeight.w700)),
          ]),
        ),
      ),
    );
  }
}
