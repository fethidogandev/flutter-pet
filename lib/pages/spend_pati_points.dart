import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/button_with_text.dart';
import 'package:patidayanisma/theme/colors.dart';

class SpendPatiPoints extends StatefulWidget {
  const SpendPatiPoints({super.key});

  @override
  _SpendPatiPointsState createState() => _SpendPatiPointsState();
}

class _SpendPatiPointsState extends State<SpendPatiPoints> {
  // Variables
  final int totalPoints = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: primaryPurpleColor,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: primaryPurpleColor, size: 30),
        title: Text("Spend Points",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 20),
          // Total Points Text
          Text(
            "Total Points",
            style: GoogleFonts.montserrat(
                fontSize: 22,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          // Total Points
          Text(
            totalPoints.toString(),
            style: GoogleFonts.montserrat(
                fontSize: 26,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          // Description
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Text(
              "You can activate your 1 Month Premium membership when you have 100 Points.",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontSize: 17,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 50),
          // Conditional Render For Spend Points Button
          totalPoints >= 100
              ? ButtonWithText(
                  buttonFunc: () {},
                  buttonName: "Use Points",
                )
              : const SizedBox(),
        ],
      )),
    );
  }
}
