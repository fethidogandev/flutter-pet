import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController controller;
  final Icon? suffixIcon;
  final String fieldText;
  final void Function(String value) onChange;
  const UsernameField(
      {super.key,
      required this.controller,
      this.suffixIcon,
      required this.fieldText,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
          hintText: fieldText,
          focusColor: Colors.blue,
          prefixIconConstraints: const BoxConstraints(minWidth: 60),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 60,
          ),
          prefixIcon: Image.asset(
            "lib/images/user-icon.png",
            width: 30,
            height: 30,
          ),
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 33, 150, 243),
              fontSize: 17,
              fontWeight: FontWeight.w600,
              letterSpacing: 2),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 33, 150, 243),
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 153, 72, 255),
              width: 2,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 33, 150, 243),
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
          suffixIcon: suffixIcon),
      style: GoogleFonts.montserrat(
          fontSize: 17,
          color: const Color.fromARGB(255, 33, 150, 243),
          fontWeight: FontWeight.w600),
    );
  }
}
