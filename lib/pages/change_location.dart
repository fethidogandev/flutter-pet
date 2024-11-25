import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:patidayanisma/components/button_with_text.dart';
import 'package:patidayanisma/components/google_places.dart';
import 'package:patidayanisma/components/gps_button.dart';
import 'package:patidayanisma/theme/colors.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({super.key});

  @override
  _ChangeLocationState createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  // Text Editing Controllers
  TextEditingController controller = TextEditingController();

  // Disposal
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Validators
  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please type address';
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
        title: Text("Initial Position",
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
            // Address Bar & GPS Button
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GooglePlaces(
                      controller: controller,
                      boxDecoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5,
                              color: const Color.fromARGB(255, 33, 150, 243)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40))),
                      inputDecoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 5),
                        hintText: "Type Address",
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 33, 150, 243),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                        ),
                      ),
                      debounceTime: 400,
                      isLatLngRequired: true,
                      getPlaceDetailWithLatLng: (Prediction prediction) {
                        // ignore: avoid_print, prefer_interpolation_to_compose_strings
                        print("placeDetails" + prediction.lat.toString());
                        print(prediction.description);
                      },
                      itemClick: (Prediction prediction) {
                        controller.text = prediction.description ?? "";
                        controller.selection = TextSelection.fromPosition(
                            TextPosition(
                                offset: prediction.description?.length ?? 0));
                      },
                      seperatedBuilder: const Divider(),
                      containerHorizontalPadding: 10,
                      itemBuilder: (context, index, Prediction prediction) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color.fromARGB(255, 33, 150, 243),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Expanded(
                                  child: Text(prediction.description ?? "",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 15,
                                          color: primaryBlueColor,
                                          fontWeight: FontWeight.w600)))
                            ],
                          ),
                        );
                      },
                      isCrossBtnShown: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const GpsButton()
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Change Button
            ButtonWithText(buttonFunc: () {}, buttonName: "Change"),
          ],
        ),
      ),
    );
  }
}
