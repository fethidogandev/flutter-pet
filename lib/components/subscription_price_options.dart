import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class SubscriptionPriceOptions extends StatelessWidget {
  final void Function() onTap;
  final bool isSelected;
  final String monthTitle;
  final String priceTag;
  const SubscriptionPriceOptions(
      {super.key,
      required this.onTap,
      required this.isSelected,
      required this.monthTitle,
      required this.priceTag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? const Color.fromARGB(255, 153, 72, 255)
                : Colors.grey,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            isSelected
                ? Icon(
                    Icons.check,
                    color: primaryPurpleColor,
                    size: 30,
                  )
                : const Icon(Icons.circle_outlined, color: Colors.grey),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  monthTitle,
                  style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: isSelected ? primaryPurpleColor : primaryTextColor,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  priceTag,
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: isSelected ? primaryPurpleColor : primaryTextColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
