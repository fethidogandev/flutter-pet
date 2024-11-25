import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdDetailsContactButtons extends StatelessWidget {
  final void Function() onTap;
  final String buttonText;
  final Image imageData;
  final Color colorData;
  const AdDetailsContactButtons(
      {super.key,
      required this.onTap,
      required this.buttonText,
      required this.imageData,
      required this.colorData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ((MediaQuery.of(context).size.width / 2) * 85) / 100,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: colorData,
            ),
            borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(buttonText,
                  style: GoogleFonts.montserrat(
                      fontSize: 16.5,
                      color: colorData,
                      fontWeight: FontWeight.w600)),
              imageData
            ],
          ),
        ),
      ),
    );
  }
}
