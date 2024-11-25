import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patidayanisma/components/ad_fields.dart';
import 'package:patidayanisma/components/ad_submission_switch.dart';
import 'package:patidayanisma/components/age_slider.dart';
import 'package:patidayanisma/components/button_with_icon.dart';
import 'package:patidayanisma/components/contact_switches.dart';
import 'package:patidayanisma/components/dropdown.dart';
import 'package:patidayanisma/components/google_places.dart';
import 'package:patidayanisma/components/gps_button.dart';
import 'package:patidayanisma/components/pick_image_camera.dart';
import 'package:patidayanisma/components/select_image_button.dart';
import 'package:patidayanisma/components/submit_ad_contact_fields.dart';
import 'package:patidayanisma/constants.dart';
import 'package:patidayanisma/theme/colors.dart';

class SubmitAdoptionAds extends StatefulWidget {
  const SubmitAdoptionAds({super.key});

  @override
  _SubmitAdoptionAdsState createState() => _SubmitAdoptionAdsState();
}

class _SubmitAdoptionAdsState extends State<SubmitAdoptionAds> {
  // ScrollController
  final ScrollController _scrollController = ScrollController();

  // Formkey
  final _formKey = GlobalKey<FormState>();

  // Textcontrollers
  final TextEditingController _googlePlaceController = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
  double age = 1;
  bool sterilized = false;
  bool vaccine = false;
  bool passport = false;
  bool chip = false;

  // canHave Attributes
  bool canVaccinated = true;
  bool canSterilized = true;
  bool canHavePassport = true;
  bool canHaveChip = true;

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

  // Set canHave Attribues
  void canHaveAttributes() {
    var canBeVaccinated = animals.firstWhere(
        (animal) => animal['animal'] == selectedAnimal,
        orElse: () => {})['canVaccinated'];

    var canBeSterilized = animals.firstWhere(
        (animal) => animal['animal'] == selectedAnimal,
        orElse: () => {})['canSterilized'];

    var canBeHavePassport = animals.firstWhere(
        (animal) => animal['animal'] == selectedAnimal,
        orElse: () => {})['canHavePassport'];

    var canBeHaveChip = animals.firstWhere(
        (animal) => animal['animal'] == selectedAnimal,
        orElse: () => {})['canHaveChip'];

    setState(() {
      canVaccinated = canBeVaccinated;
      canSterilized = canBeSterilized;
      canHavePassport = canBeHavePassport;
      canHaveChip = canBeHaveChip;
    });
  }

  // Selected Images
  List<File> _selectedImages = [];

  // Pick Image From Gallet
  Future<void> _pickImageFromGallery() async {
    if (_selectedImages.length >= 4) {
      // Max 3 Images - Show a message or handle the case
      return;
    }
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImages.add(File(returnedImage.path));
    });
  }

  Future<void> _pickImageFromCamera() async {
    if (_selectedImages.length >= 4) {
      // Max 3 Images - Show a message or handle the case
      return;
    }
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

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

  void _scrollToTextField() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  // Regex
  final usernameRegex = RegExp(r'^[a-zA-Z0-9._]{1,30}$');
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Validate Title
  String? _validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      _scrollToTextField();
      return 'Please type ad title';
    }
    if (value.length < 30) {
      _scrollToTextField();
      return 'Title must be at least 30 characters long';
    }
    return null;
  }

  // Validate Description
  String? _validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      _scrollToTextField();
      return 'Please type ad description';
    }
    if (value.length < 30) {
      _scrollToTextField();
      return 'Description must be at least 200 characters long';
    }
    return null;
  }

  // Validate Email
  String? _validateEmail(String? value) {
    if ((value == null || value.isEmpty) && isEmailVisible == true) {
      return 'Please type your E-Mail address';
    }
    if (!emailRegex.hasMatch(value!)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Validate Facebook
  String? _validateFacebook(String? value) {
    if ((value == null || value.isEmpty) && isFacebookVisible == true) {
      return 'Please type your Facebook address';
    }
    if (!usernameRegex.hasMatch(value!)) {
      return 'Invalid Facebook username';
    }
    return null;
  }

  // Validate Instagram
  String? _validateInstagram(String? value) {
    if ((value == null || value.isEmpty) && isInstagramVisible == true) {
      return 'Please type your Instagram address';
    }
    if (!usernameRegex.hasMatch(value!)) {
      return 'Invalid Instagram username';
    }
    return null;
  }

  // Thumbnail Images
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
        title: Text("Adoption Ad",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
        controller: _scrollController,
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
                    // Address Info
                    Text(
                      "Address Info",
                      style: GoogleFonts.montserrat(
                          fontSize: 17,
                          color: primaryPurpleColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    // Google Places & GPS
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: GooglePlaces(
                            controller: _googlePlaceController,
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
                              _googlePlaceController.text =
                                  prediction.description ?? "";
                              _googlePlaceController.selection =
                                  TextSelection.fromPosition(TextPosition(
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
                    // Animal Info Text
                    Text(
                      "Animal Info",
                      style: GoogleFonts.montserrat(
                          fontSize: 17,
                          color: primaryPurpleColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    // Age Slider
                    AgeSlider(
                      currentAge: age,
                      onChange: (value) {
                        setState(() {
                          age = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    // Animal Type Dropdowns
                    Dropdown(
                        selectedValue: selectedAnimal!,
                        onChange: (String newValue) {
                          setState(() {
                            selectedAnimal = newValue;
                            vaccine = false;
                            passport = false;
                            chip = false;
                            sterilized = false;
                          });
                          updateAnimalBreeds();
                          canHaveAttributes();
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
                    const SizedBox(height: 10),
                    // sterilized
                    canSterilized
                        ? AdSubmissionSwitch(
                            switchName: "Sterilized?",
                            switchValue: sterilized,
                            onChange: (value) {
                              setState(() {
                                sterilized = !sterilized;
                              });
                            },
                          )
                        : const SizedBox(),
                    // Vaccined
                    canVaccinated
                        ? AdSubmissionSwitch(
                            switchName: "Vaccined?",
                            switchValue: vaccine,
                            onChange: (value) {
                              setState(() {
                                vaccine = !vaccine;
                              });
                            },
                          )
                        : const SizedBox(),
                    // Passport
                    canHavePassport
                        ? AdSubmissionSwitch(
                            switchName: "Passport?",
                            switchValue: passport,
                            onChange: (value) {
                              setState(() {
                                passport = !passport;
                              });
                            },
                          )
                        : const SizedBox(),
                    // Chip
                    canHaveChip
                        ? AdSubmissionSwitch(
                            switchName: "Chip?",
                            switchValue: chip,
                            onChange: (value) {
                              setState(() {
                                chip = !chip;
                              });
                            },
                          )
                        : const SizedBox(),
                    const SizedBox(height: 15),
                    // Contact Information
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
                                  isFacebookVisible = false;
                                  isInstagramVisible = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Contact Switches
                    isContactVisible
                        ? Column(
                            children: [
                              // E-Mail
                              ContactSwitches(
                                label: 'E-Mail',
                                value: isEmailVisible,
                                onChanged: (value) {
                                  if (value == false) {
                                    _emailController.text = "";
                                  }
                                  setState(() {
                                    isEmailVisible = value;
                                  });
                                },
                              ),
                              // Email Text Field
                              isEmailVisible
                                  ? SubmitAdContactFields(
                                      controller: _emailController,
                                      fieldName: "E-Mail",
                                      validator: _validateEmail)
                                  : const SizedBox(),
                              // Facebook
                              ContactSwitches(
                                label: 'Facebook',
                                value: isFacebookVisible,
                                onChanged: (value) {
                                  if (value == false) {
                                    _facebookController.text = "";
                                  }
                                  setState(() {
                                    isFacebookVisible = value;
                                  });
                                },
                              ),
                              // Facebook Text Field
                              isFacebookVisible
                                  ? SubmitAdContactFields(
                                      controller: _facebookController,
                                      fieldName: "Facebook Username",
                                      validator: _validateFacebook)
                                  : const SizedBox(),
                              // Instagram
                              ContactSwitches(
                                label: 'Instagram',
                                value: isInstagramVisible,
                                onChanged: (value) {
                                  if (value == false) {
                                    _instagramController.text = "";
                                  }
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
                    const SizedBox(height: 20),
                    // Choose Image
                    Row(
                      children: [
                        // From Gallery
                        Expanded(
                          child: SelectImageButton(
                            selectTap: () {
                              _pickImageFromGallery();
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        // From Camera
                        PickImageCamera(
                          onTap: () {
                            _pickImageFromCamera();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Thumbnail Images
                    Wrap(
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
                            // Confirmed action
                          }
                          print(selectedAnimal);
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
