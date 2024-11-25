import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class LinkComponent extends StatelessWidget {
  final void Function() navigationFunc;
  final String linkDescription;
  final Image ImageData;
  const LinkComponent(
      {super.key,
      required this.navigationFunc,
      required this.linkDescription,
      required this.ImageData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: GestureDetector(
        onTap: navigationFunc,
        child: Container(
          height: 58,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2, color: primaryPurpleColor),
              borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  linkDescription,
                  style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: primaryPurpleColor,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                ImageData
              ],
            ),
          ),
        ),
      ),
    );
  }
}
