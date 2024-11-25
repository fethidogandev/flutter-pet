import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:patidayanisma/components/follow_us.dart';
import 'package:patidayanisma/components/link_component.dart';
import 'package:patidayanisma/main.dart';
import 'package:patidayanisma/pages/banned_users.dart';
import 'package:patidayanisma/pages/change_bio.dart';
import 'package:patidayanisma/pages/change_location.dart';
import 'package:patidayanisma/pages/change_username.dart';
import 'package:patidayanisma/pages/faq.dart';
import 'package:patidayanisma/pages/welcome_page.dart';
import 'package:patidayanisma/theme/colors.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // In App Review
  final InAppReview _inAppReview = InAppReview.instance;

  // Google Sign In
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  // AuthProvider
  late AuthProvider authProvider;

  // Initstate
  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
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
        title: Text("Settings",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
          child: Column(
        children: [
          // Link
          LinkComponent(
            navigationFunc: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const Faq(),
                  opaque: false,
                ),
              );
            },
            linkDescription: "FAQ",
            ImageData: Image.asset(
              "lib/images/faq.png",
              width: 44,
              height: 44,
            ),
          ),
          // Link
          LinkComponent(
            navigationFunc: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const BannedUsers(),
                  opaque: false,
                ),
              );
            },
            linkDescription: "Banned Users",
            ImageData: Image.asset(
              "lib/images/banned-users.png",
              width: 44,
              height: 44,
            ),
          ),
          // Link
          LinkComponent(
            navigationFunc: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const ChangeUsername(),
                  opaque: false,
                ),
              );
            },
            linkDescription: "Change Username",
            ImageData: Image.asset(
              "lib/images/change-username.png",
              width: 44,
              height: 44,
            ),
          ),
          // Link
          LinkComponent(
            navigationFunc: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const ChangeBio(),
                  opaque: false,
                ),
              );
            },
            linkDescription: "Change Description",
            ImageData: Image.asset(
              "lib/images/change-description.png",
              width: 44,
              height: 44,
            ),
          ),
          // Link
          LinkComponent(
            navigationFunc: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const ChangeLocation(),
                  opaque: false,
                ),
              );
            },
            linkDescription: "Initial Position",
            ImageData: Image.asset(
              "lib/images/map-loc.png",
              width: 44,
              height: 44,
            ),
          ),
          // Link
          LinkComponent(
            navigationFunc: () async {
              if (await _inAppReview.isAvailable()) {
                _inAppReview.requestReview();
                // appstore id is only required for ios
                _inAppReview.openStoreListing();
              }
            },
            linkDescription: "Leave Us Feedback",
            ImageData: Image.asset(
              "lib/images/rate-us.png",
              width: 44,
              height: 44,
            ),
          ),
          const SizedBox(height: 10),
          // Social Media
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Social Media",
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: primaryPurpleColor,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                // Follow Buttons
                const Row(
                  children: [
                    FollowUs(
                        link: "https://www.instagram.com/1233",
                        imagePath: "lib/images/insta.webp"),
                    SizedBox(width: 10),
                    FollowUs(
                        link: "https://www.facebook.com/1233",
                        imagePath: "lib/images/facebook.png"),
                    SizedBox(width: 10),
                    FollowUs(
                        link: "https://www.x.com/1233",
                        imagePath: "lib/images/xlogo.webp"),
                    SizedBox(width: 10),
                    FollowUs(
                        link: "https://www.whatsapp.com/chanel/1233",
                        imagePath: "lib/images/whatsapp.webp"),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          // Contact Us
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Contact Us",
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: primaryPurpleColor,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () {
                    launch("mailto:helpd@pety.app");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryBlueColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.email_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Logout Button
          GestureDetector(
            onTap: () async {
              await _googleSignIn.signOut();
              authProvider.logout();
              SharedPreferences prefs = await SharedPreferences.getInstance();
              print(prefs.getBool('isAuthenticated'));
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const WelcomePage(),
                  opaque: false,
                ),
              );
            },
            child: Container(
              width: 370,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: const Color.fromARGB(255, 234, 103, 23),
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Çıkış Yap",
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            letterSpacing: 2.5,
                            color: const Color.fromARGB(255, 234, 103, 23),
                            fontWeight: FontWeight.w700)),
                    const SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "lib/images/exit.png",
                      width: 44,
                      height: 44,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
