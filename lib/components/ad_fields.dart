import 'package:flutter/material.dart';

class AdFields extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value) validator;
  final String hintText;
  final int maxLines;
  final int maxLength;

  const AdFields(
      {super.key,
      required this.controller,
      required this.validator,
      required this.hintText,
      required this.maxLines,
      required this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        focusColor: const Color.fromARGB(255, 33, 150, 243),
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 33, 150, 243),
          fontSize: 17,
          fontWeight: FontWeight.w500,
          letterSpacing: 2,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 33, 150, 243),
            width: 1.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 33, 150, 243),
            width: 1.5,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 33, 150, 243),
            width: 1.5,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(
          20,
          10,
          10,
          23,
        ),
      ),
      validator: validator,
    );
  }
}
