import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class Dropdown extends StatelessWidget {
  final String selectedValue;
  final void Function(String value) onChange;
  final List<dynamic> listToRender;
  const Dropdown(
      {super.key,
      required this.selectedValue,
      required this.onChange,
      required this.listToRender});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        if (newValue != null) {
          onChange(newValue);
        }
      },
      decoration: const InputDecoration(
        focusColor: Color.fromARGB(255, 33, 150, 243),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 33, 150, 243),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 33, 150, 243),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 33, 150, 243),
            width: 1.5,
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(
          20,
          0,
          15,
          20,
        ),
      ),
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: Color.fromARGB(255, 33, 150, 243),
        size: 28,
      ),
      menuMaxHeight: 300,
      items: listToRender.map((dynamic value) {
        return DropdownMenuItem<String>(
          alignment: AlignmentDirectional.center,
          value: value,
          child: Text(
            value,
            style: GoogleFonts.montserrat(
                fontSize: 17,
                color: primaryBlueColor,
                fontWeight: FontWeight.w600),
          ),
        );
      }).toList(),
    );
  }
}
