import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:patidayanisma/components/bottom_navigation.dart';
import 'package:patidayanisma/components/button_with_icon.dart';
import 'package:patidayanisma/components/distance_slider.dart';
import 'package:patidayanisma/components/dropdown.dart';
import 'package:patidayanisma/components/google_places.dart';
import 'package:patidayanisma/components/gps_button.dart';
import 'package:patidayanisma/components/homepage_categories.dart';
import 'package:patidayanisma/components/homepage_social_banner.dart';
import 'package:patidayanisma/components/user_profile_ads.dart';
import 'package:patidayanisma/pages/adoption.dart';
import 'package:patidayanisma/pages/lost.dart';
import 'package:patidayanisma/pages/mating.dart';
import 'package:patidayanisma/pages/message_box.dart';
import 'package:patidayanisma/pages/needs.dart';
import 'package:patidayanisma/pages/notifications.dart';
import 'package:patidayanisma/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // variables
  double currentKMValue = 30;
  bool isCenterLocationSet = true;

  // Textediting Controllers
  TextEditingController controller = TextEditingController();

  // User Pic
  final String imageUrl = "lib/images/welcome-pet.png";

  // Selected Dropdown Variables
  String? selectedCategory = "Show All";
  String? selectedAnimal = "Show All";
  String? selectedBreed = "Show All";
  String? selectedGender = "Show All";

  // Category Options
  List<String> categoryOptions = ['Show All', 'Adoption', 'Lost', 'Mating'];

  // Bottom Navigation index
  int selectedIndex = 0;

  // Filtering Options
  void showBottomModal(BuildContext context) {
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
                // Category Dropdown
                Text(
                  "Category",
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Dropdown(
                    selectedValue: selectedCategory!,
                    onChange: (String newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                    listToRender: categoryOptions),
                const SizedBox(height: 10),
                // Distance Field
                DistanceSlider(
                  currentKMValue: currentKMValue,
                  onChange: (double value) {
                    setState(() {
                      currentKMValue = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                // Apply Filters
                ButtonWithIcon(
                    textAndIconColor: primaryPurpleColor,
                    buttonText: "Apply Filter",
                    onTap: () {},
                    borderColor: primaryPurpleColor),
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
      // Bottom Navbar
      bottomNavigationBar: BottomNavigation(
        selectedIndex: selectedIndex,
      ),
      backgroundColor: backgroundColor,
      // Appbar
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leadingWidth: 70,
        toolbarHeight: 70,
        leading: Container(
          margin: const EdgeInsets.only(left: 10, top: 10),
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage(imageUrl),
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello',
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: primaryPurpleColor,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w700)),
            Text('fethi_dogan88',
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: primaryTextColor,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Image.asset(
                  "lib/images/bell.png",
                  height: 32,
                  width: 32,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Notifications(),
                      opaque: false,
                    ),
                  );
                },
              ),
              Positioned(
                top: -5,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const Notifications(),
                        opaque: false,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      color: primaryGreenColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(3.toString(),
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          Stack(
            children: [
              IconButton(
                icon: Image.asset(
                  "lib/images/message.png",
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MessageBox(),
                      opaque: false,
                    ),
                  );
                },
              ),
              Positioned(
                top: -5,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const MessageBox(),
                        opaque: false,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      color: primaryGreenColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text("5",
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // Body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            // Top Banner Sliders
            CarouselSlider(
              options: CarouselOptions(
                height: 150,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 1100),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: [
                // Instagram
                HomepageSocialBanners(
                  textAndBackgroundColor: primaryPurpleColor,
                  heading: "Follow Us On Instagram",
                  buttonText: "Follow Us",
                  imageData: Image.asset(
                    "lib/images/cat-instagram.png",
                    width: 90,
                    height: 90,
                  ),
                  onTap: () {
                    launch("https://www.instagram.com");
                  },
                ),
                // Youtube
                HomepageSocialBanners(
                  textAndBackgroundColor: Colors.orange[800]!,
                  heading: "Donate Us On Patreon",
                  buttonText: "Donate Us",
                  imageData: Image.asset(
                    "lib/images/patreon.png",
                    width: 90,
                    height: 90,
                  ),
                  onTap: () {
                    launch("https://www.youtube.com");
                  },
                ),
                // Youtube
                HomepageSocialBanners(
                  textAndBackgroundColor: Colors.green[500]!,
                  heading: "Subscribe Our Youtube",
                  buttonText: "Subscribe Youtube",
                  imageData: Image.asset(
                    "lib/images/cat-youtube.png",
                    width: 90,
                    height: 90,
                  ),
                  onTap: () {
                    launch("https://www.youtube.com");
                  },
                ),
                // Facebook
                HomepageSocialBanners(
                  textAndBackgroundColor: primaryBlueColor,
                  heading: "Follow Us on Facebook",
                  buttonText: "Follow Us",
                  imageData: Image.asset(
                    "lib/images/cat-facebook.png",
                    width: 90,
                    height: 90,
                  ),
                  onTap: () {
                    launch("https://www.facebook.com");
                  },
                ),
                // Whatsapp
                HomepageSocialBanners(
                  textAndBackgroundColor: Colors.indigoAccent!,
                  heading: "Join Our Whatsapp Channel",
                  buttonText: "Join Whatsapp",
                  imageData: Image.asset(
                    "lib/images/cat-whatsapp.png",
                    width: 90,
                    height: 90,
                  ),
                  onTap: () {
                    launch("https://www.whatsapp.com");
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text("Categories",
                  style: GoogleFonts.montserrat(
                      fontSize: 19,
                      color: primaryTextColor,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Adoption Category
                HomepageCategories(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Adoption(),
                        ),
                      );
                    },
                    imageData: Image.asset(
                      "lib/images/adoption-home.png",
                      fit: BoxFit.cover,
                    ),
                    category: "Adoption"),

                // Needs
                // HomepageCategories(
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         PageRouteBuilder(
                //           pageBuilder:
                //               (context, animation, secondaryAnimation) =>
                //                   const Needs(),
                //         ),
                //       );
                //     },
                //     backgroundColor: const Color.fromARGB(255, 130, 221, 250),
                //     imageData: Image.asset(
                //       "lib/images/needs-map.png",
                //       fit: BoxFit.cover,
                //     ),
                //     category: "Needs"),

                // Lost Animal
                HomepageCategories(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Lost(),
                        ),
                      );
                    },
                    backgroundColor: const Color.fromARGB(255, 249, 162, 56),
                    imageData: Image.asset(
                      "lib/images/kayip.gif",
                      fit: BoxFit.contain,
                    ),
                    category: "Lost"),
                // Mating
                HomepageCategories(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Mating(),
                        ),
                      );
                    },
                    backgroundColor: const Color.fromARGB(255, 248, 214, 221),
                    imageData: Image.asset(
                      "lib/images/mating-home.png",
                      fit: BoxFit.cover,
                    ),
                    category: "Mating"),
              ],
            ),
            // Close Ads
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ads near you",
                      style: GoogleFonts.montserrat(
                          fontSize: 19,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w500)),
                  GestureDetector(
                    onTap: () {
                      showBottomModal(context);
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: primaryBlueColor,
                          ),
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 12,
                        ),
                        child: Image.asset(
                          "lib/images/filter.png",
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Address selection Condition
            const SizedBox(height: 15),
            isCenterLocationSet
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: UserProfileAds(
                      adThumbImage: "lib/images/cat-example.jpg",
                      id: "123",
                      title: "Looking for food please asap for my cats.",
                      date: "12.11.2022",
                      mainCategory: "adoption",
                      mainAndSubCategory: "Adoption - Cat",
                      redirectToAds: () {},
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10, top: 10),
                        child: Row(
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
                                getPlaceDetailWithLatLng:
                                    (Prediction prediction) {
                                  // ignore: avoid_print, prefer_interpolation_to_compose_strings
                                  print("placeDetails" +
                                      prediction.lat.toString());
                                  print(prediction.description);
                                },
                                itemClick: (Prediction prediction) {
                                  controller.text =
                                      prediction.description ?? "";
                                  controller.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset:
                                              prediction.description?.length ??
                                                  0));
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
                                          color:
                                              Color.fromARGB(255, 33, 150, 243),
                                        ),
                                        const SizedBox(width: 7),
                                        Expanded(
                                            child: Text(
                                                prediction.description ?? "",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 15,
                                                    color: primaryBlueColor,
                                                    fontWeight:
                                                        FontWeight.w600)))
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                            "You should select an address to see ads near you. Don't worry the selected address will only visible to you.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
