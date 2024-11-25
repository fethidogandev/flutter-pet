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
import 'package:patidayanisma/pages/submit_adoption_ads.dart';
import 'package:patidayanisma/theme/colors.dart';

class Adoption extends StatefulWidget {
  const Adoption({super.key});

  @override
  _AdoptionState createState() => _AdoptionState();
}

class _AdoptionState extends State<Adoption> {
  // Default KM
  double currentKMValue = 30;

  // Text editing Controllers
  TextEditingController controller = TextEditingController();
  TextEditingController ageController = TextEditingController(text: '25');

  // Default Selected Options
  String? selectedAnimal = "Show All Animals";
  String? selectedBreed = "Show All Breeds";
  String? selectedGender = "Show All Genders";
  String? selectedVaccine = "Show All";
  String? selectedNeutralization = 'Show All';
  String? hasPassport = "Show All";
  String? hasChip = "Show All";

  // Dropdown options
  List<String> animalOptions = ['Show All Animals', 'Cat', 'Dog', 'Bird'];
  List<String> breedOptions = ['Show All Breeds', 'Siamese', 'Sphynx'];
  List<String> genderOptions = ['Show All Genders', 'Male', 'Female'];
  List<String> vaccineOptions = ['Show All', 'Vaccinated', 'Not Vaccined'];
  List<String> neutralizationOptions = [
    'Show All',
    'Neutralized',
    'Not Neutralized'
  ];
  List<String> passportOptions = ['Show All', 'Has Passport', 'No Passport'];
  List<String> chipOptions = ['Show All', 'Has Chip', 'No Chip'];

  // Filter Modal
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
                // Animal options
                Dropdown(
                    selectedValue: selectedAnimal!,
                    onChange: (String newValue) {
                      setState(() {
                        selectedAnimal = newValue;
                      });
                    },
                    listToRender: animalOptions),
                const SizedBox(height: 10),
                // Animal Breed options
                Dropdown(
                    selectedValue: selectedBreed!,
                    onChange: (String newValue) {
                      setState(() {
                        selectedBreed = newValue;
                      });
                    },
                    listToRender: breedOptions),
                const SizedBox(height: 10),
                // Gemder option
                Dropdown(
                    selectedValue: selectedGender!,
                    onChange: (String newValue) {
                      setState(() {
                        selectedGender = newValue;
                      });
                    },
                    listToRender: genderOptions),
                const SizedBox(height: 10),
                // Vaccine options
                Text(
                  "Vaccinated",
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Dropdown(
                    selectedValue: selectedVaccine!,
                    onChange: (String newValue) {
                      setState(() {
                        selectedVaccine = newValue;
                      });
                    },
                    listToRender: vaccineOptions),
                const SizedBox(height: 10),
                // Fertility options
                Text(
                  "Neutralized",
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Dropdown(
                    selectedValue: selectedNeutralization!,
                    onChange: (String newValue) {
                      setState(() {
                        selectedNeutralization = newValue;
                      });
                    },
                    listToRender: neutralizationOptions),
                const SizedBox(height: 10),
                // Passport options
                Text(
                  "Passport",
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Dropdown(
                    selectedValue: hasPassport!,
                    onChange: (String newValue) {
                      setState(() {
                        hasPassport = newValue;
                      });
                    },
                    listToRender: passportOptions),
                const SizedBox(height: 10),
                // Chip option box
                Text(
                  "Chip",
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Dropdown(
                    selectedValue: hasChip!,
                    onChange: (String newValue) {
                      setState(() {
                        hasChip = newValue;
                      });
                    },
                    listToRender: chipOptions),
                const SizedBox(height: 10),
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
        title: Text("Sahiplendirme",
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
                  // Address Bar & GPS Button
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
                                  const SubmitAdoptionAds(),
                          opaque: false,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  // Ads
                  UserProfileAds(
                    id: "344",
                    adThumbImage: "lib/images/cat-example.jpg",
                    title:
                        "Acil mama lazım arkadaşlar acill! asd  asd ssssnapcam bilmiyorum",
                    date: "12.11.2022",
                    mainCategory: "adoption",
                    mainAndSubCategory: "Adoption - Cat",
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
