import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patidayanisma/components/ad_fields.dart';
import 'package:patidayanisma/components/button_with_icon.dart';
import 'package:patidayanisma/components/contact_switches.dart';
import 'package:patidayanisma/components/dropdown.dart';
import 'package:patidayanisma/components/google_places.dart';
import 'package:patidayanisma/components/gps_button.dart';
import 'package:patidayanisma/components/select_image_button.dart';
import 'package:patidayanisma/components/submit_ad_contact_fields.dart';
import 'package:patidayanisma/constants.dart';
import 'package:patidayanisma/theme/colors.dart';

class SubmitMatingAds extends StatefulWidget {
  const SubmitMatingAds({super.key});

  @override
  _SubmitMatingAdsState createState() => _SubmitMatingAdsState();
}

class _SubmitMatingAdsState extends State<SubmitMatingAds> {
  // Formkey
  final _formKey = GlobalKey<FormState>();

  // Textediting Controller
  TextEditingController controller = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();

  // Contact Variables
  bool isContactVisible = false;
  bool isPhoneVisible = false;
  bool isEmailVisible = false;
  bool isFacebookVisible = false;
  bool isInstagramVisible = false;

  // Define the selected option variable
  String? selectedAnimal = animals[0]["animal"];
  String? selectedBreed = animals[0]["breeds"][0];
  String? selectedGender = "Male";

  // Dropdown options
  List<dynamic> animalOptions = animals.map((e) => e["animal"]).toList();
  List<String> genderOptions = ['Male', 'Female'];

// Update Animal Breeds On Changed
  List<String> updateAnimalBreeds() {
    var animalBreeds = animals
        .where((animal) => animal['animal'] == selectedAnimal)
        .map((cat) => cat['breeds'])
        .expand((breeds) => breeds)
        .cast<String>()
        .toList();

    setState(() {
      selectedBreed = animalBreeds[0];
    });

    return animalBreeds;
  }

  // Selected Images
  List<File> _selectedImages = [];

  // Pick Image
  Future<void> _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImages.add(File(returnedImage.path));
    });
  }

  // Remove Image
  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  // Validators
  String? _validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please type title';
    }
    return null;
  }

  String? _validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please type description';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if ((value == null || value.isEmpty) && isEmailVisible == true) {
      return 'Please type your E-Mail address';
    }
    return null;
  }

  String? _validateFacebook(String? value) {
    if ((value == null || value.isEmpty) && isFacebookVisible == true) {
      return 'Please type your Facebook address';
    }
    return null;
  }

  String? _validateInstagram(String? value) {
    if ((value == null || value.isEmpty) && isInstagramVisible == true) {
      return 'Please type your Facebook address';
    }
    return null;
  }

  // Image Thumbnails
  Widget _buildImageThumbnail(File imageFile, int index) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: FileImage(imageFile),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              _removeImage(index);
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
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
        title: Text("Mating Ad",
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
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Ad Info
                    Text(
                      "Ad Info",
                      style: GoogleFonts.montserrat(
                          fontSize: 17,
                          color: primaryPurpleColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    // Title Input
                    AdFields(
                      controller: _title,
                      validator: _validateTitle,
                      hintText: 'Title',
                      maxLines: 2,
                      maxLength: 80,
                    ),
                    // Sized Box
                    const SizedBox(height: 10),
                    // Description Input
                    AdFields(
                      controller: _description,
                      validator: _validateDescription,
                      hintText: 'Description Max 500 Characters',
                      maxLines: 4,
                      maxLength: 500,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Address Info",
                      style: GoogleFonts.montserrat(
                          fontSize: 17,
                          color: primaryPurpleColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
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
                                    color: const Color.fromARGB(
                                        255, 33, 150, 243)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40))),
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
                            itemBuilder:
                                (context, index, Prediction prediction) {
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
                                        child: Text(
                                            prediction.description ?? "",
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
                    const SizedBox(height: 7),
                    Text("Please type closest location to you",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 15),
                    // Our Animal
                    Text(
                      "Your Animal",
                      style: GoogleFonts.montserrat(
                          fontSize: 17,
                          color: primaryPurpleColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    // Animal Type Dropdowns
                    Dropdown(
                        selectedValue: selectedAnimal!,
                        onChange: (String newValue) {
                          setState(() {
                            selectedAnimal = newValue;
                          });
                          updateAnimalBreeds();
                        },
                        listToRender: animalOptions),
                    const SizedBox(height: 10),
                    // Breed option Dropdown
                    Dropdown(
                        selectedValue: selectedBreed!,
                        onChange: (String newValue) {
                          setState(() {
                            selectedBreed = newValue;
                          });
                        },
                        listToRender: updateAnimalBreeds()),
                    const SizedBox(height: 10),
                    // Gemder option dropdown
                    Dropdown(
                        selectedValue: selectedGender!,
                        onChange: (String newValue) {
                          setState(() {
                            selectedGender = newValue;
                          });
                        },
                        listToRender: genderOptions),
                    const SizedBox(height: 25),

                    // Contact Info
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Contact Info",
                              style: GoogleFonts.montserrat(
                                  fontSize: 17,
                                  color: isContactVisible
                                      ? primaryBlueColor
                                      : primaryPurpleColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Switch(
                              value: isContactVisible,
                              activeColor: primaryBlueColor,
                              inactiveThumbColor: primaryTextColor,
                              inactiveTrackColor:
                                  const Color.fromARGB(255, 217, 217, 217),
                              onChanged: (bool value) {
                                setState(() {
                                  isContactVisible = !isContactVisible;
                                  isEmailVisible = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Contact Conditional Render
                    isContactVisible
                        ? Column(
                            children: [
                              // E-Mail
                              ContactSwitches(
                                label: 'E-Mail',
                                value: isEmailVisible,
                                onChanged: (value) {
                                  setState(() {
                                    isEmailVisible = value;
                                  });
                                },
                              ),
                              // E-Mail
                              isEmailVisible
                                  ? SubmitAdContactFields(
                                      controller: _email,
                                      fieldName: "E-Mail",
                                      validator: _validateEmail)
                                  : const SizedBox(),
                              // Facebook
                              ContactSwitches(
                                label: 'Facebook',
                                value: isFacebookVisible,
                                onChanged: (value) {
                                  setState(() {
                                    isFacebookVisible = value;
                                  });
                                },
                              ),
                              // Facebook Text Field
                              isFacebookVisible
                                  ? SubmitAdContactFields(
                                      controller: _facebookController,
                                      fieldName: "Facebook",
                                      validator: _validateFacebook)
                                  : const SizedBox(),
                              // Instagram
                              ContactSwitches(
                                label: 'Instagram',
                                value: isInstagramVisible,
                                onChanged: (value) {
                                  setState(() {
                                    isInstagramVisible = value;
                                  });
                                },
                              ),
                              // Instagram Text Field
                              isInstagramVisible
                                  ? SubmitAdContactFields(
                                      controller: _instagramController,
                                      fieldName: "Instagram Username",
                                      validator: _validateInstagram)
                                  : const SizedBox(),
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(height: 15),
                    // Pick Image
                    SelectImageButton(
                      selectTap: () {
                        _pickImageFromGallery();
                      },
                    ),
                    const SizedBox(height: 10),
                    // Thumbnail images
                    Row(
                      children: _selectedImages
                          .asMap()
                          .entries
                          .map(
                            (entry) =>
                                _buildImageThumbnail(entry.value, entry.key),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 15),
                    // Submit Ad
                    ButtonWithIcon(
                        iconData: Icon(
                          Icons.arrow_forward_ios,
                          color: primaryPurpleColor,
                          size: 30,
                        ),
                        textAndIconColor: primaryPurpleColor,
                        buttonText: "Submit Ad",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            print("object");
                          }
                        },
                        borderColor: primaryPurpleColor),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
