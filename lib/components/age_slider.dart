import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class AgeSlider extends StatelessWidget {
  final double currentAge;
  final void Function(double value) onChange;
  const AgeSlider(
      {super.key, required this.currentAge, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        '${currentAge.round()} - Age',
        style: GoogleFonts.montserrat(
            fontSize: 17, color: primaryTextColor, fontWeight: FontWeight.w600),
      ),
      Slider(
        value: currentAge,
        min: 1,
        max: 25,
        divisions: ((25 - 1) ~/ 1),
        label: currentAge.round().toString(),
        onChanged: onChange,
      )
    ]);
  }
}
