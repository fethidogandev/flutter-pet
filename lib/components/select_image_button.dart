import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class SelectImageButton extends StatefulWidget {
  final void Function() selectTap;
  const SelectImageButton({super.key, required this.selectTap});

  @override
  State<SelectImageButton> createState() => _SelectImageButtonState();
}

class _SelectImageButtonState extends State<SelectImageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.selectTap,
      child: Center(
        child: Container(
          width: (MediaQuery.of(context).size.width * 90) / 100,
          height: 60,
          decoration: BoxDecoration(
            color: primaryBlueColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.image,
                size: 30,
                color: Colors.white,
              ),
              Text(
                "Pick Image",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
