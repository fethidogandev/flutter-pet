import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/pages/ad_details_adoption.dart';
import 'package:patidayanisma/pages/ad_details_lost.dart';
import 'package:patidayanisma/pages/ad_details_mating.dart';
import 'package:patidayanisma/pages/ad_details_needs.dart';
import 'package:patidayanisma/theme/colors.dart';

class UserProfileAds extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final String mainCategory;
  final String mainAndSubCategory;
  final String adThumbImage;
  final void Function() redirectToAds;
  final void Function()? onLongPress;

  const UserProfileAds(
      {super.key,
      required this.title,
      required this.date,
      required this.mainAndSubCategory,
      required this.redirectToAds,
      required this.mainCategory,
      this.onLongPress,
      required this.id,
      required this.adThumbImage});

  @override
  Widget build(BuildContext context) {
    Color decideBackgroundColor() {
      // Logic to determine the background color based on your variables
      // Example logic:
      if (mainCategory == "need") {
        return needsBgColor;
      } else if (mainCategory == "adoption") {
        return adoptionBgColor;
      } else if (mainCategory == "lost") {
        return lostBgColor;
      } else if (mainCategory == "mating") {
        return couplingBgColor;
      } else {
        return Colors.white;
      }
    }

    void decideRedirect() {
      if (mainCategory == "adoption") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdoptionAdDetails(
              id: id,
            ),
          ),
        );
      } else if (mainCategory == "need") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NeedsAdDetails(
              id: id,
            ),
          ),
        );
      } else if (mainCategory == "lost") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LostAdDetails(
              id: id,
            ),
          ),
        );
      } else if (mainCategory == "mating") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MatingAdDetails(
              id: id,
            ),
          ),
        );
      }
    }

    return GestureDetector(
      onTap: () {
        decideRedirect();
      },
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: primaryPurpleColor),
            color: decideBackgroundColor(),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        adThumbImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width * 70) / 100,
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Text(title,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(date,
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: primaryTextColor,
                                    fontWeight: FontWeight.w500)),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(mainAndSubCategory,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
