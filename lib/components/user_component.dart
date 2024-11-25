import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class UserComponent extends StatelessWidget {
  final String username;
  final String imageUrl;
  final String numOfAds;
  final Image iconData;
  final void Function() redirectToUser;
  final void Function()? onLongPress;
  final void Function() iconFunction;
  const UserComponent(
      {super.key,
      required this.username,
      required this.imageUrl,
      required this.numOfAds,
      required this.iconData,
      required this.redirectToUser,
      required this.iconFunction,
      this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          GestureDetector(
            onLongPress: onLongPress,
            onTap: redirectToUser,
            child: CircleAvatar(
              radius: 26.0,
              backgroundImage: AssetImage(imageUrl),
            ),
          ),
          Expanded(
            child: Container(
              height: 70,
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onLongPress: onLongPress,
                    onTap: redirectToUser,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(username,
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: primaryPurpleColor,
                                fontWeight: FontWeight.w600)),
                        Text("Total Ads : $numOfAds",
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: iconFunction,
                    child: iconData,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
