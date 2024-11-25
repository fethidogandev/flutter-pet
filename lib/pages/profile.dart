import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patidayanisma/components/appbar_component.dart';
import 'package:patidayanisma/components/bottom_navigation.dart';
import 'package:patidayanisma/components/button_with_text.dart';
import 'package:patidayanisma/components/link_component.dart';
import 'package:patidayanisma/components/premium_bottom_options.dart';
import 'package:patidayanisma/components/select_image_button.dart';
import 'package:patidayanisma/components/subscription_price_options.dart';
import 'package:patidayanisma/pages/invite_friend.dart';
import 'package:patidayanisma/pages/settings.dart';
import 'package:patidayanisma/pages/spend_pati_points.dart';
import 'package:patidayanisma/theme/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Variables
  int selectedIndex = 3;
  final String imageUrl = "lib/images/welcome-pet.png";
  final String username = "fethi_asd_ss";
  bool isPremium = true;
  File? selectedImage;

  // Pick Image from gallery
  Future<void> _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }

  // Remove Selected Image
  void _removeSelectedImage() {
    setState(() {
      selectedImage = null;
    });
  }

  // Image Picker Bottom Sheet
  void showImagePickModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  // Select Image Button
                  SelectImageButton(
                    selectTap: () {
                      _pickImageFromGallery().then((_) {
                        setState(() {});
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  // Image Preview
                  if (selectedImage != null) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 25),
                      child: Center(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(500),
                              child: Image.file(
                                selectedImage!,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  _removeSelectedImage();
                                  setState(() {}); // Trigger rebuild
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 15),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom navigation
      bottomNavigationBar: BottomNavigation(selectedIndex: selectedIndex),
      // Appbar
      appBar: AppbarComponent(
        title: "Profile",
        numberOfMessages: 3,
        numberOfNotifications: 6,
        implyLeading: false,
        backgroundColor: backgroundColor,
        showMessageIcon: true,
        showNotificationIcon: true,
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
          child: Column(
        children: [
          // Image and Edit Icon
          Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 100.0,
                    backgroundImage: AssetImage(imageUrl),
                  ),
                  isPremium
                      ? Positioned(
                          top: 140.0,
                          right: 10.0,
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  width: 1.8,
                                  color: primaryBlueColor,
                                )),
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                size: 35,
                                color: primaryBlueColor,
                              ),
                              onPressed: () {
                                showImagePickModal(context);
                              },
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
          // Crown Image
          isPremium
              ? Image.asset(
                  "lib/images/crown.png",
                  width: 40,
                  height: 40,
                )
              : const SizedBox(height: 5),
          // Username
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(username,
                  style: GoogleFonts.montserrat(
                      fontSize: 22,
                      color: primaryPurpleColor,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 4),
          // User Description
          SizedBox(
            width: 340,
            child: Text(
              "No more fucking annoying people. Dont add me as friend",
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          !isPremium ? const PremiumWidget() : const SizedBox(),
          // Link Component
          LinkComponent(
            navigationFunc: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const SpendPatiPoints(),
                  opaque: false,
                ),
              );
            },
            linkDescription: "Spend Petzy Points",
            ImageData: Image.asset(
              "lib/images/spend-point.png",
              width: 44,
              height: 44,
            ),
          ),
          // Link Component
          LinkComponent(
            navigationFunc: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const InviteFriend(),
                  opaque: false,
                ),
              );
            },
            linkDescription: "Invite & Earn Points",
            ImageData: Image.asset(
              "lib/images/earn-point.png",
              width: 44,
              height: 44,
            ),
          ),
          // Link Component
          LinkComponent(
            navigationFunc: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const Settings(),
                  opaque: false,
                ),
              );
            },
            linkDescription: "Settings",
            ImageData: Image.asset(
              "lib/images/settings.png",
              width: 44,
              height: 44,
            ),
          ),
        ],
      )),
    );
  }
}

// Subscription Selection
class SubscriptionSelection extends StatefulWidget {
  const SubscriptionSelection({super.key});

  @override
  _SubscriptionSelectionState createState() => _SubscriptionSelectionState();
}

class _SubscriptionSelectionState extends State<SubscriptionSelection> {
  // Variables
  bool oneMonth = true;
  bool threeMonth = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Subscription Options
        SubscriptionPriceOptions(
          onTap: () {
            setState(() {
              oneMonth = true;
              threeMonth = false;
            });
          },
          isSelected: oneMonth,
          monthTitle: '1 Month Subscription',
          priceTag: '50 TL',
        ),
        const SizedBox(height: 7),
        // Subscription Options
        SubscriptionPriceOptions(
          onTap: () {
            setState(() {
              threeMonth = true;
              oneMonth = false;
            });
          },
          isSelected: threeMonth,
          monthTitle: '3 Month Subscription',
          priceTag: '130 TL / 20 TL İndirim',
        ),
      ],
    );
  }
}

// Premium Bottom Sheet
class PremiumWidget extends StatelessWidget {
  const PremiumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LinkComponent(
      navigationFunc: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Subscription Title
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Petzy Premium",
                          style: GoogleFonts.montserrat(
                              fontSize: 22,
                              color: primaryPurpleColor,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "lib/images/crown.png",
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Subscription Description
                  Column(
                    children: [
                      Text("Unlock all features with Premium",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 7),
                      // Subscription Features
                      const PremiumBottomOptions(description: "Add Friends"),
                      const PremiumBottomOptions(description: "Messaging"),
                      const PremiumBottomOptions(
                          description: "Custom Profile Picture"),
                      const PremiumBottomOptions(
                          description: "Extra Ad Submission"),
                      const SizedBox(height: 10),
                      // Subscription Selection
                      const SubscriptionSelection(),
                      const SizedBox(height: 5),
                      // Refund Text
                      Text(
                          "You can cancel your subscription anytime on Google Play",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 15),
                      // Start Subscription Button
                      ButtonWithText(
                          buttonFunc: () {}, buttonName: "Start Subscription"),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      linkDescription: "Premium Üye ol",
      ImageData: Image.asset(
        "lib/images/crown.png",
        width: 44,
        height: 44,
      ),
    );
  }
}
