import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class NotificationDismissContainer extends StatelessWidget {
  final String description;
  final String date;
  final String time;
  final Icon iconData;

  const NotificationDismissContainer(
      {super.key,
      required this.description,
      required this.date,
      required this.time,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: primaryPurpleColor,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: iconData,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(description,
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500)),
                      Row(
                        children: [
                          Text(date,
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w600)),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(time,
                                style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    letterSpacing: 2,
                                    color: primaryTextColor,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
