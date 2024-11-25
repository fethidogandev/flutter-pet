import 'package:flutter/material.dart';
import 'package:patidayanisma/components/appbar_component.dart';
import 'package:patidayanisma/components/bottom_navigation.dart';
import 'package:patidayanisma/components/friends_switch_tabs.dart';
import 'package:patidayanisma/components/my_ads_options_bottom_sheet.dart';
import 'package:patidayanisma/components/user_profile_ads.dart';
import 'package:patidayanisma/theme/colors.dart';

class MyAds extends StatefulWidget {
  const MyAds({super.key});

  @override
  _MyAdsState createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> {
  // Show Type
  String? selectedShowType = "Active";

  // Bottom Navigation index
  int selectedIndex = 1;

  // Ad options bottom sheet
  void showOptionsBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return MyAdsOptionsBottomSheet(
          editAd: () {},
          deleteAd: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(selectedIndex: selectedIndex),
      // Appbar
      appBar: AppbarComponent(
        title: "My Ads",
        numberOfMessages: 3,
        numberOfNotifications: 4,
        implyLeading: false,
        backgroundColor: backgroundColor,
        showMessageIcon: true,
        showNotificationIcon: true,
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 8),
              // Switch Tabs
              SwitchTabs(
                  leftButtonText: "Active",
                  rightButtonText: "Passive",
                  selectedShowType: selectedShowType!,
                  onTapFriends: () {
                    setState(() {
                      selectedShowType = "Active";
                    });
                  },
                  onTapRequests: () {
                    setState(() {
                      selectedShowType = "Passive";
                    });
                  },
                  numberOfRequests: "4"),
              const SizedBox(height: 15),
              // Conditional Rendering
              selectedShowType == "Active"
                  ? UserProfileAds(
                      id: "1111",
                      adThumbImage: "lib/images/cat-example.jpg",
                      title: "I need to adopt my cat to someone",
                      date: "12.11.2022",
                      mainCategory: "adoption",
                      mainAndSubCategory: "Adoption - Cat",
                      redirectToAds: () {},
                      onLongPress: () {
                        showOptionsBottomSheet();
                      },
                    )
                  : UserProfileAds(
                      id: "44444",
                      adThumbImage: "lib/images/cat-example.jpg",
                      title: "URGENT i lost my cat",
                      date: "12.11.2022",
                      mainCategory: "lost",
                      mainAndSubCategory: "Lost - Cat",
                      redirectToAds: () {},
                      onLongPress: () {
                        showOptionsBottomSheet();
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
