import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:patidayanisma/components/ad_details_appbar.dart';
import 'package:patidayanisma/components/ad_details_contact_bottom_sheet.dart';
import 'package:patidayanisma/components/ad_details_contact_button.dart';
import 'package:patidayanisma/components/ad_details_report_options.dart';
import 'package:patidayanisma/components/ad_details_show_options.dart';
import 'package:patidayanisma/components/ad_details_show_report_submit.dart';
import 'package:patidayanisma/components/animal_infos.dart';
import 'package:patidayanisma/components/image_carousel.dart';
import 'package:patidayanisma/components/user_info_and_message.dart';
import 'package:patidayanisma/theme/colors.dart';

class LostAdDetails extends StatefulWidget {
  // widget.id ile id nin numarasını al
  final String id;
  const LostAdDetails({super.key, required this.id});

  @override
  _LostAdDetailsState createState() => _LostAdDetailsState();
}

class _LostAdDetailsState extends State<LostAdDetails> {
  // İs Owner
  bool isAdOwner = false;

  // Ad Details
  final String title = "We are looking for new home for our siamese cat";
  final String description =
      "We are looking for new home for our siamese cat. Because we are moving to another country and we really need someone to make our cat happy.";
  final String address = "London Eye - London Eye / London";
  final String animal = "Cow";
  final String breed = "Simmental";
  final String gender = "Male";
  final String prize = "2500";

  // Contact Details
  final String telegram = "neasd_dasdasd_ss";
  final String email = "asdasd@asdddasd.com";
  final String facebook = "asddasdasd_x";

  // Image URLS
  final List<String> imageUrls = [
    'https://via.placeholder.com/1024x768',
    'https://via.placeholder.com/1024x768',
    'https://via.placeholder.com/1024x768',
  ];

  // User image
  final String imageUrl = "lib/images/welcome-pet.png";

  // Map Coordinates
  static const LatLng _center = LatLng(37.7749, -122.4194);
  static const LatLng _marker = LatLng(37.7749, -122.4194);

  // Text editing controllers
  final TextEditingController _description = TextEditingController();
  final TextEditingController _userReportDescription = TextEditingController();

  // Selected Report
  String? selectedReport = "";

  // Selected Ad Report Type
  String? selectedAdReportType = "Fake Ad";

  // Selected User Report Type
  String? selectedUserReportType = "Inappropriate Behavior";

  // Ad Report Options
  List<String> reportType = [
    "Fake Ad",
    "Hate speech",
    "Other",
  ];

  // User Report Options
  List<String> userReportType = [
    'Inappropriate Behavior',
    'Inappropriate Profile Image',
    "Fake Ad Submission",
  ];

  // Dispose
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _description.dispose();
    _userReportDescription.dispose();
    super.dispose();
  }

  // Validations
  String? _validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please type description';
    }
    return null;
  }

  String? _validateUserDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please type description';
    }
    return null;
  }

  // Submit Report
  void sendReportUser() {
    print("user");
  }

  void sendReportAd() {
    print("ad");
  }

  // Report Modal
  void showReportModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return AdDetailsShowReportSubmit(
            onButtonSubmit:
                selectedReport == "Ad" ? sendReportAd : sendReportUser,
            validateDescription: selectedReport == "Ad"
                ? _validateDescription
                : _validateUserDescription,
            description:
                selectedReport == "Ad" ? _description : _userReportDescription,
            onDescriptionChange: (value) {
              if (selectedReport == "Ad") {
                setState(() {
                  selectedAdReportType = value;
                });
              } else {
                setState(() {
                  selectedUserReportType = value;
                });
              }
            },
            selectedReportType: selectedReport == "Ad"
                ? selectedAdReportType!
                : selectedUserReportType!,
            reportType: selectedReport == "Ad" ? reportType : userReportType);
      },
    );
  }

  // Show Options Modal
  void showOptionsBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AdDetailsShowOptions(
          redirectEditAd: () {},
          removeAd: () {},
        );
      },
    );
  }

  // Show Report Options Modal
  void showReportOptionsBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AdDetailsReportOptions(
          reportModal: (context) {
            showReportModal(context);
            setState(() {
              selectedReport = "Ad";
            });
          },
          userReportModal: (context) {
            showReportModal(context);
            setState(() {
              selectedReport = "User";
            });
          },
        );
      },
    );
  }

  // Show Contact Info Modal
  void showContactBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AdDetailsContactBottomSheet(
          telegram: telegram,
          email: email,
          facebook: facebook,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AdDetailsAppbar(
        adCategory: "Lost",
        isAdOwner: false,
        showOptions: () {
          showOptionsBottomSheet();
        },
        showReportOptions: () {
          showReportOptionsBottomSheet();
        },
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Slider
              ImageCarousel(imageUrls: imageUrls),
              // User Info
              UserInfoAndMessage(
                  imageUrl: imageUrl,
                  username: "fethi_doxasd",
                  numOfAds: "15",
                  isPremium: false),
              const SizedBox(height: 10),
              // Location Info
              Row(
                children: [
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.location_on_outlined,
                        size: 36,
                        color: primaryBlueColor,
                      )),
                  const SizedBox(width: 10),
                  Text(address,
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: primaryBlueColor,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 8),
              // Animal
              AnimalInfos(
                image: Image.asset(
                  "lib/images/${animal.toLowerCase()}.png",
                  scale: 1.3,
                ),
                infoText: "$animal - $breed",
                textColor: const Color.fromARGB(255, 206, 59, 59),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Gender Info
                  AnimalInfos(
                    image: Image.asset(
                      gender == "Male"
                          ? "lib/images/male.png"
                          : "lib/images/female.png",
                      scale: 1.2,
                    ),
                    infoText: gender,
                    textColor: gender == "Male"
                        ? primaryBlueColor
                        : const Color.fromARGB(255, 239, 104, 26),
                  ),
                  // Prize
                  AnimalInfos(
                    image: Image.asset(
                      "lib/images/dollar-symbol.png",
                      scale: 1.5,
                    ),
                    infoText: prize,
                    textColor: Colors.green[700]!,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Google Map
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width * 95) / 100,
                      height: 170,
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
                ),
              ),
              // Title
              Text(title,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: primaryPurpleColor,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 15),
              // Description
              Text(description,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      height: 1.4,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              // Contact Details & Send Message
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AdDetailsContactButtons(
                      onTap: () {
                        showContactBottomSheet();
                      },
                      buttonText: "Contact",
                      imageData: Image.asset(
                        "lib/images/phone.png",
                        height: 32,
                        width: 32,
                      ),
                      colorData: primaryPurpleColor,
                    ),
                    AdDetailsContactButtons(
                      onTap: () {},
                      buttonText: "Message",
                      imageData: Image.asset(
                        "lib/images/send-message.png",
                        height: 34,
                        width: 34,
                      ),
                      colorData: primaryBlueColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
