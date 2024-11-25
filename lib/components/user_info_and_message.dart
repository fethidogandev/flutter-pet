import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/pages/message_box.dart';
import 'package:patidayanisma/pages/userprofile.dart';
import 'package:patidayanisma/theme/colors.dart';

class UserInfoAndMessage extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String numOfAds;
  final bool isPremium;
  const UserInfoAndMessage(
      {super.key,
      required this.imageUrl,
      required this.username,
      required this.numOfAds,
      required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 5),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const UserProfile(),
                  opaque: false,
                ),
              );
            },
            child: CircleAvatar(
              radius: 28.0,
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
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const UserProfile(),
                          opaque: false,
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(username,
                              style: GoogleFonts.montserrat(
                                  fontSize: 17,
                                  color: primaryPurpleColor,
                                  fontWeight: FontWeight.w600)),
                          isPremium
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Image.asset(
                                    "lib/images/crown.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                )
                              : SizedBox()
                        ]),
                        Text("Total Ads : $numOfAds",
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const MessageBox(),
                          opaque: false,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.5, color: primaryBlueColor),
                          borderRadius: BorderRadius.circular(100)),
                      child: Image.asset(
                        "lib/images/send-message.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
