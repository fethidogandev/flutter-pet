import 'package:flutter/material.dart';

class SubmitAdContactFields extends StatelessWidget {
  final TextEditingController controller;
  final String fieldName;
  final String? Function(String?) validator;
  const SubmitAdContactFields(
      {super.key,
      required this.controller,
      required this.fieldName,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: fieldName,
        focusColor: const Color.fromARGB(255, 33, 150, 243),
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 33, 150, 243),
          fontSize: 17,
          fontWeight: FontWeight.w500,
          letterSpacing: 2,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 33, 150, 243),
            width: 1.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 33, 150, 243),
            width: 1.5,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 33, 150, 243),
            width: 1.5,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(
          20,
          10,
          0,
          23,
        ),
      ),
      validator: validator,
    );
  }
}
