import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallCategoryButtons extends StatelessWidget {
  final void Function() onTap;
  final Color mainColor;
  final Image buttonImage;
  final String buttonText;
  const SmallCategoryButtons(
      {super.key,
      required this.onTap,
      required this.mainColor,
      required this.buttonImage,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ((MediaQuery.of(context).size.width / 2) * 90) / 100,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: mainColor,
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
                      color: mainColor,
                      fontWeight: FontWeight.w600)),
              buttonImage
            ],
          ),
        ),
      ),
    );
  }
}
