import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/button_with_text.dart';
import 'package:patidayanisma/theme/colors.dart';

class AdDetailsShowReportSubmit extends StatelessWidget {
  final TextEditingController description;
  final String? Function(String? value) validateDescription;
  final void Function(String? value) onDescriptionChange;
  final String selectedReportType;
  final List<String> reportType;
  final void Function() onButtonSubmit;

  const AdDetailsShowReportSubmit({
    super.key,
    required this.validateDescription,
    required this.description,
    required this.onDescriptionChange,
    required this.selectedReportType,
    required this.reportType,
    required this.onButtonSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: DropdownButtonFormField<String>(
              value: selectedReportType,
              onChanged: onDescriptionChange,
              decoration: const InputDecoration(
                focusColor: Colors.blue,
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
                    color: Color.fromARGB(255, 153, 72, 255),
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
                  10,
                  23,
                ),
              ),
              icon: const Icon(
                Icons.arrow_drop_down_circle,
                color: Color.fromARGB(255, 153, 72, 255),
                size: 28,
              ),
              items: reportType.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: primaryPurpleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              maxLines: 4,
              controller: description,
              decoration: const InputDecoration(
                hintText: "Şikayet Nedeniniz",
                focusColor: Colors.blue,
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 153, 72, 255),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
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
              style: GoogleFonts.montserrat(
                  fontSize: 17,
                  color: primaryPurpleColor,
                  fontWeight: FontWeight.w600),
              validator: validateDescription,
            ),
          ),
          Center(
            child:
                ButtonWithText(buttonFunc: onButtonSubmit, buttonName: "Send"),
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
