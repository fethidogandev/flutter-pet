import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWithIcon extends StatelessWidget {
  final Color textAndIconColor;
  final Color borderColor;
  final Icon? iconData;
  final String buttonText;
  final void Function() onTap;
  const ButtonWithIcon(
      {super.key,
      required this.textAndIconColor,
      this.iconData,
      required this.buttonText,
      required this.onTap,
      required this.borderColor});

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
            color: borderColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(buttonText,
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    letterSpacing: 2.5,
                    color: textAndIconColor,
                    fontWeight: FontWeight.w700)),
            if (iconData != null) ...[
              const SizedBox(width: 10),
              iconData!,
            ]
          ]),
        ),
      ),
    );
  }
}
