import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:patidayanisma/components/button_with_text.dart';
import 'package:patidayanisma/components/distance_slider.dart';
import 'package:patidayanisma/components/dropdown.dart';
import 'package:patidayanisma/components/filter_submit.dart';
import 'package:patidayanisma/components/google_places.dart';
import 'package:patidayanisma/components/gps_button.dart';
import 'package:patidayanisma/components/user_profile_ads.dart';
import 'package:patidayanisma/pages/submit_mating_ads.dart';
import 'package:patidayanisma/theme/colors.dart';

class Mating extends StatefulWidget {
  const Mating({super.key});

  @override
  _MatingState createState() => _MatingState();
}

class _MatingState extends State<Mating> {
  // Initial KM
  double currentKMValue = 30;

  // Text Editing Controllers
  TextEditingController controller = TextEditingController();

  // Define the selected option variable
  String? selectedAnimal = "Show All";
  String? selectedBreed = "Show All";
  String? selectedGender = "Show All";

  // Dropdown options
  List<String> animalOptions = ['Show All', 'Kedi', 'Köpek', 'Kuş'];
  List<String> genderOptions = ['Show All', 'Erkek', 'Dişi'];
  List<String> breedOptions = ['Show All', 'Siamese', 'Van'];

  // Show Filter Bottom Sheet
  void showFilterModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                // Animal Options
                Text(
                  "Animal",
                  style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Dropdown(
                    selectedValue: selectedAnimal!,
                    onChange: (String newValue) {
                      setState(() {
                        selectedAnimal = newValue;
                      });
                    },
                    listToRender: animalOptions),
                const SizedBox(height: 10),
                // Animal Breed
                Text(
                  "Animal Breed",
                  style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Dropdown(
                    selectedValue: selectedBreed!,
                    onChange: (String newValue) {
                      setState(() {
                        selectedBreed = newValue;
                      });
                    },
                    listToRender: breedOptions),
                const SizedBox(height: 10),
                // Gender options
                Text(
                  "Gender",
                  style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Dropdown(
                    selectedValue: selectedGender!,
                    onChange: (String newValue) {
                      setState(() {
                        selectedGender = newValue;
                      });
                    },
                    listToRender: genderOptions),
                const SizedBox(height: 15),
                // Distance Slider
                DistanceSlider(
                  currentKMValue: currentKMValue,
                  onChange: (double value) {
                    setState(() {
                      currentKMValue = value;
                    });
                  },
                ),
                const SizedBox(height: 15),
                // Apply Filter Button
                ButtonWithText(
                  buttonFunc: () {},
                  buttonName: "Apply Filter",
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
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
        title: Text("Mating",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 15),
                  // Address Box & GPS
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GooglePlaces(
                          controller: controller,
                          boxDecoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5,
                                  color:
                                      const Color.fromARGB(255, 33, 150, 243)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40))),
                          inputDecoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                            hintText: "Type address",
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
                                    offset:
                                        prediction.description?.length ?? 0));
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
                  const SizedBox(height: 10),
                  // Filter & Submit Buttons
                  FilterAndSubmit(
                    onTapFilter: () {
                      showFilterModal(context);
                    },
                    onTapSubmit: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const SubmitMatingAds(),
                          opaque: false,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  // User Ads
                  UserProfileAds(
                    id: "444",
                    adThumbImage: "lib/images/cat-example.jpg",
                    title: "I need mate my cat asap please",
                    date: "12.11.2022",
                    mainCategory: "mating",
                    mainAndSubCategory: "Mating - Cat",
                    redirectToAds: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
