import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomepageSocialBanners extends StatelessWidget {
  final Color textAndBackgroundColor;
  final String heading;
  final String buttonText;
  final Image imageData;
  final void Function() onTap;

  const HomepageSocialBanners(
      {super.key,
      required this.textAndBackgroundColor,
      required this.heading,
      required this.buttonText,
      required this.imageData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 90) / 100,
      decoration: BoxDecoration(
        color: textAndBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    heading,
                    style: GoogleFonts.montserrat(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 186,
                      height: 34,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          buttonText,
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: textAndBackgroundColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            imageData
          ],
        ),
      ),
    );
  }
}
