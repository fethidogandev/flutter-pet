import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class DistanceSlider extends StatelessWidget {
  final double currentKMValue;
  final void Function(double value) onChange;
  const DistanceSlider(
      {super.key, required this.currentKMValue, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Search in Distance: ${currentKMValue.round().toString()} KM',
        style: GoogleFonts.montserrat(
            fontSize: 16, color: primaryTextColor, fontWeight: FontWeight.w600),
      ),
      Slider(
        value: currentKMValue,
        min: 5,
        max: 150,
        divisions: ((150 - 5) ~/ 5),
        label: currentKMValue.round().toString(),
        onChanged: onChange,
      )
    ]);
  }
}
