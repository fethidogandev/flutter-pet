import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:patidayanisma/components/button_with_text.dart';
import 'package:patidayanisma/components/distance_slider.dart';
import 'package:patidayanisma/components/dropdown.dart';
import 'package:patidayanisma/components/filter_submit.dart';
import 'package:patidayanisma/components/google_places.dart';
import 'package:patidayanisma/components/gps_button.dart';
import 'package:patidayanisma/components/show_list.dart';
import 'package:patidayanisma/components/user_profile_ads.dart';
import 'package:patidayanisma/pages/submit_needs_ads.dart';
import 'package:patidayanisma/theme/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Needs extends StatefulWidget {
  const Needs({super.key});

  @override
  _NeedsState createState() => _NeedsState();
}

class _NeedsState extends State<Needs> {
  // Inıtial KM
  double currentKMValue = 30;

  // Text Editing Controller
  TextEditingController controller = TextEditingController();

  // Map Coordinates
  static const LatLng _center = LatLng(37.7749, -122.4194);
  static const LatLng _marker = LatLng(37.7749, -122.4194);

  // Define the selected option variable
  String? selectedAnimal = "Show All";
  String? selectedNeed = "Show All";
  String? selectedShowType = "Listing";

  // Dropdown options
  List<String> animalOptions = ['Show All', 'Cat', 'Dog', 'Bird'];
  List<String> needOptions = [
    'Show All',
    'Food - Water',
    'Veterinary',
    'Animal House',
  ];

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
                // Needs options
                Text(
                  "Need",
                  style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Dropdown(
                    selectedValue: selectedNeed!,
                    onChange: (String newValue) {
                      setState(() {
                        selectedNeed = newValue;
                      });
                    },
                    listToRender: needOptions),
                const SizedBox(height: 10),
                // Animal
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
        title: Text("Needs",
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
                                  const SubmitNeedsAds(),
                          opaque: false,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  // List & Map View
                  ShowListAndMap(
                    onTapMap: () {
                      setState(() {
                        selectedShowType = "Map";
                      });
                    },
                    showType: selectedShowType!,
                    onTapList: () {
                      setState(() {
                        selectedShowType = "Listing";
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  // Conditions For List & Map View
                  selectedShowType == "Map"
                      ? Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              width: (MediaQuery.of(context).size.width * 95) /
                                  100,
                              height:
                                  (MediaQuery.of(context).size.height * 60) /
                                      100,
                              child: GoogleMap(
                                zoomControlsEnabled: false,
                                myLocationEnabled: true,
                                myLocationButtonEnabled: true,
                                buildingsEnabled: false,
                                markers: {
                                  const Marker(
                                    markerId: MarkerId("1"),
                                    position: _marker,
                                  ),
                                },
                                initialCameraPosition: const CameraPosition(
                                  target: _center,
                                  zoom: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      : UserProfileAds(
                          id: "4512",
                          adThumbImage: "lib/images/cat-example.jpg",
                          title: "I need cat food for my cats asap please",
                          date: "12.11.2022",
                          mainCategory: "need",
                          mainAndSubCategory: "Need - Food",
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
