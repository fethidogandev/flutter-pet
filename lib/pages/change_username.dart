import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/button_with_text.dart';
import 'package:patidayanisma/components/username_field.dart';
import 'package:patidayanisma/theme/colors.dart';

class ChangeUsername extends StatefulWidget {
  const ChangeUsername({super.key});

  @override
  _ChangeUsernameState createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {
  // Text editing controllers
  final TextEditingController _usernameController = TextEditingController();

  // Variables
  bool isUsernameTaken = false;

  // Disposal
  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

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
        title: Text("Change Username",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 15),
                // Change Username Textfield
                UsernameField(
                  controller: _usernameController,
                  fieldText: "Username",
                  onChange: (value) {},
                  suffixIcon: isUsernameTaken
                      ? const Icon(
                          Icons.cancel_rounded,
                          size: 35,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.check,
                          size: 35,
                          color: Colors.blue,
                        ),
                ),
                const SizedBox(height: 25),
                // Change Button
                ButtonWithText(buttonFunc: () {}, buttonName: "Change"),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
