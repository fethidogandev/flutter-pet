import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextIconCircleButton extends StatelessWidget {
  final void Function() onTap;
  final Color borderColor;
  final String buttonText;
  final Icon? iconData;
  final IconButton? iconButton;
  const TextIconCircleButton(
      {super.key,
      required this.onTap,
      required this.borderColor,
      required this.buttonText,
      this.iconData,
      this.iconButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(buttonText,
                  style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: borderColor,
                      fontWeight: FontWeight.w700)),
              if (iconData != null) iconData!,
              if (iconButton != null) iconButton!,
            ],
          ),
        ),
      ),
    );
  }
}
