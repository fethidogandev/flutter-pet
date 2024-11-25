import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/ad_details_show_report_submit.dart';
import 'package:patidayanisma/components/add_friend_and_message.dart';
import 'package:patidayanisma/components/text_icon_circle_button.dart';
import 'package:patidayanisma/components/user_profile_ads.dart';
import 'package:patidayanisma/theme/colors.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Variables
  final TextEditingController _description = TextEditingController();
  final String username = "asdasd_asdd_xxx";
  final String imageUrl = "lib/images/welcome-pet.png";
  bool isUserBanned = false;
  bool isUserReported = false;
  bool isFriend = true;
  bool isPremiumUser = true;

  // Define the selected option variable
  String? selectedReportType = "Uygunsuz Hareket";

  // Dropdown options
  List<String> reportType = [
    'Inappropriate Behavior',
    'Inappropriate Images',
    "Fake Ad",
  ];

  // Disposal
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _description.dispose();
    super.dispose();
  }

  // Validations
  String? _validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please submit username.';
    }
    return null;
  }

  // Report User
  void showReportUserDetails(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return AdDetailsShowReportSubmit(
            onButtonSubmit: () {},
            validateDescription: _validateDescription,
            description: _description,
            onDescriptionChange: (value) {
              setState(() {
                selectedReportType = value;
              });
            },
            selectedReportType: selectedReportType!,
            reportType: reportType);
      },
    );
  }

  // Show report options
  void showReportOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Report User
                TextIconCircleButton(
                  onTap: () {
                    showReportUserDetails(context);
                  },
                  borderColor: Colors.orange[600]!,
                  buttonText: "Report User",
                  iconButton: IconButton(
                    icon: Image.asset(
                      "lib/images/report-user2.png",
                      scale: 1.2,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 10),
                // Ban User
                TextIconCircleButton(
                  onTap: () {},
                  borderColor: Colors.red[700]!,
                  buttonText: "Ban User",
                  iconButton: IconButton(
                    icon: Image.asset(
                      "lib/images/banned-users.png",
                      scale: 1.2,
                    ),
                    onPressed: () {},
                  ),
                ),
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
        actions: [
          IconButton(
            icon: Image.asset(
              "lib/images/report-user2.png",
              height: 40,
              width: 40,
            ),
            onPressed: () {
              showReportOptions(context);
            },
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      // Body
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                // User Profile Picture
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: AssetImage(imageUrl),
                  ),
                ),
                // Crown
                isPremiumUser
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
                const SizedBox(height: 7),
                // Profile Description
                SizedBox(
                  width: 340,
                  child: Text(
                    "No more fucking annoying please.",
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                // User Not Banned
                !isUserBanned
                    ? AddFriendAndMessage(
                        isFriend: isFriend,
                        addToFriend: () {},
                        removeFriend: () {},
                      )
                    : const SizedBox(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: UserProfileAds(
                    adThumbImage: "lib/images/cat-example.jpg",
                    id: "654",
                    title: "I need food asap for my animals",
                    date: "12.11.2022",
                    mainCategory: "need",
                    mainAndSubCategory: "Need - Food",
                    redirectToAds: () {},
                  ),
                ),
              ],
            )),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
