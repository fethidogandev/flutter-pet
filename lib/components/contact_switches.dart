import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class ContactSwitches extends StatefulWidget {
  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const ContactSwitches({
    required this.label,
    required this.value,
    this.onChanged,
  });

  @override
  _ContactSwitchesState createState() => _ContactSwitchesState();
}

class _ContactSwitchesState extends State<ContactSwitches> {
  late bool isSwitched;

  @override
  void initState() {
    super.initState();
    isSwitched = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            color: isSwitched ? primaryBlueColor : primaryTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Switch(
          value: isSwitched,
          activeColor: primaryBlueColor,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              widget.onChanged?.call(value);
            });
          },
        ),
      ],
    );
  }
}
