import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class AdSubmissionSwitch extends StatelessWidget {
  final String switchName;
  final bool switchValue;
  final void Function(bool value) onChange;
  const AdSubmissionSwitch(
      {super.key,
      required this.switchName,
      required this.switchValue,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              switchName,
              style: GoogleFonts.montserrat(
                  fontSize: 17,
                  color: primaryBlueColor,
                  fontWeight: FontWeight.w600),
            ),
            Switch(
              value: switchValue,
              activeColor: primaryBlueColor,
              inactiveThumbColor: primaryTextColor,
              inactiveTrackColor: const Color.fromARGB(255, 217, 217, 217),
              onChanged: onChange,
            ),
          ],
        ),
      ],
    );
  }
}
