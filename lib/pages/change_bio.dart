import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/button_with_text.dart';
import 'package:patidayanisma/theme/colors.dart';

class ChangeBio extends StatefulWidget {
  const ChangeBio({super.key});

  @override
  _ChangeBioState createState() => _ChangeBioState();
}

class _ChangeBioState extends State<ChangeBio> {
  // Formkey
  final _formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  TextEditingController _description = TextEditingController();

  // Disposal
  @override
  void dispose() {
    _description.dispose();
    super.dispose();
  }

  // Text Validators
  String? _validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen açıklamayı giriniz.';
    }
    return null;
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
        title: Text("Profile Description",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  // Change Bio Textfield
                  TextFormField(
                    maxLines: 2,
                    maxLength: 70,
                    controller: _description,
                    decoration: const InputDecoration(
                      hintText: "Profile Description",
                      focusColor: Colors.blue,
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 153, 72, 255),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 153, 72, 255),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 153, 72, 255),
                          width: 1.5,
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(
                        20,
                        10,
                        0,
                        23,
                      ),
                    ),
                    validator: _validateDescription,
                  ),
                  const SizedBox(height: 15),
                  // Change Button
                  ButtonWithText(buttonFunc: () {}, buttonName: "Change"),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
