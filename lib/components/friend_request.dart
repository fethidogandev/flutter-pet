import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class FriendRequest extends StatelessWidget {
  final String username;
  final String imageUrl;
  final bool isPremium;
  final void Function() acceptFunc;
  final void Function() rejectFunc;

  const FriendRequest(
      {super.key,
      required this.imageUrl,
      required this.isPremium,
      required this.acceptFunc,
      required this.rejectFunc,
      required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26.0,
            backgroundImage: AssetImage(imageUrl),
          ),
          Expanded(
            child: Container(
              height: 100,
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(username,
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
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
                            : const SizedBox(),
                      ]),
                      Text("Arkadaş olarak eklemek istiyor",
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: acceptFunc,
                            child: Container(
                              width: 130,
                              height: 34,
                              decoration: BoxDecoration(
                                color: primaryPurpleColor,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: Text(
                                  'Kabul Et',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: rejectFunc,
                            child: Container(
                              width: 130,
                              height: 34,
                              decoration: BoxDecoration(
                                color: Colors.red[700],
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: Text(
                                  'Reddet',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
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
