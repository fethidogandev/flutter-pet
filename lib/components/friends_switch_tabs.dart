import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class SwitchTabs extends StatelessWidget {
  final String selectedShowType;
  final String numberOfRequests;
  final String leftButtonText;
  final String rightButtonText;
  final void Function() onTapFriends;
  final void Function() onTapRequests;
  const SwitchTabs(
      {super.key,
      required this.selectedShowType,
      required this.onTapFriends,
      required this.onTapRequests,
      required this.numberOfRequests,
      required this.leftButtonText,
      required this.rightButtonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTapFriends,
          child: Container(
            width: 180,
            height: 50,
            decoration: BoxDecoration(
                color: selectedShowType == leftButtonText
                    ? primaryPurpleColor
                    : Colors.white,
                border: Border.all(
                  width: 2,
                  color: selectedShowType == leftButtonText
                      ? Colors.white
                      : primaryPurpleColor,
                ),
                borderRadius: BorderRadius.circular(40)),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(leftButtonText,
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: selectedShowType == leftButtonText
                              ? Colors.white
                              : primaryPurpleColor,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTapRequests,
          child: Stack(
            children: [
              Container(
                width: 180,
                height: 50,
                decoration: BoxDecoration(
                  color: selectedShowType == rightButtonText
                      ? primaryPurpleColor
                      : Colors.white,
                  border: Border.all(
                    width: 2,
                    color: selectedShowType == rightButtonText
                        ? Colors.white
                        : primaryPurpleColor,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        rightButtonText,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: selectedShowType == rightButtonText
                              ? Colors.white
                              : primaryPurpleColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: selectedShowType == rightButtonText
                              ? Colors.white
                              : primaryPurpleColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            numberOfRequests,
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedShowType == rightButtonText
                                  ? primaryPurpleColor
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
