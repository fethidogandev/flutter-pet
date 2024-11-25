import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/button_with_icon.dart';
import 'package:patidayanisma/components/invite_social_buttons.dart';
import 'package:patidayanisma/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class InviteFriend extends StatefulWidget {
  const InviteFriend({super.key});

  @override
  _InviteFriendState createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
  // Invite Link
  final String inviteLink = "petnetwork.app/ref/fethi_doxasd";

  // Launch Whatsapp
  void _launchWhatsApp(String url) async {
    String encodedUrl = Uri.encodeFull(url);
    String whatsappMessage = "Petzy App: $encodedUrl";
    String whatsappUrl = "whatsapp://send?text=$whatsappMessage";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text("WhatsApp cihazınızda yüklü değil",
            style: GoogleFonts.montserrat(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
      ));
    }
  }

  // Launch Twitter
  void _launchTwitter(String text) async {
    String encodedText = Uri.encodeFull(text);
    String twitterUrl = "https://twitter.com/intent/tweet?text=$encodedText";

    if (await canLaunch(twitterUrl)) {
      await launch(twitterUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text("X cihazınızda yüklü değil",
            style: GoogleFonts.montserrat(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
      ));
    }
  }

  // Launch Facebook
  void _launchFacebook(String text, String? url) async {
    String encodedText = Uri.encodeFull(text);
    String facebookUrl =
        "https://www.facebook.com/sharer/sharer.php?quote=$encodedText";

    if (url != null) {
      facebookUrl += "&u=$url";
    }

    if (await canLaunch(facebookUrl)) {
      // Launch Facebook with the pre-filled post text
      await launch(facebookUrl);
    } else {
      // If Facebook is not installed, open the website version
      await launch("https://www.facebook.com/");
    }
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
        title: Text("Invite",
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
          const SizedBox(height: 30),
          // Invite Description
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Text(
              "You will earn 10 Points for each registered user. You can activate your Premium membership when you reach 100 Points.",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontSize: 17,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 30),
          // Invite Link
          Text(
            inviteLink,
            style: GoogleFonts.montserrat(
                fontSize: 18.5,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500),
          ),
          // Share Links
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Share link",
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: primaryPurpleColor,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    InviteSocialButtons(
                        launchSocial: () {
                          _launchFacebook("text", "url");
                        },
                        logoPath: "lib/images/facebook.png"),
                    const SizedBox(width: 15),
                    InviteSocialButtons(
                        launchSocial: () {
                          _launchTwitter("X share");
                        },
                        logoPath: "lib/images/xlogo.webp"),
                    const SizedBox(width: 15),
                    InviteSocialButtons(
                        launchSocial: () {
                          _launchWhatsApp(inviteLink);
                        },
                        logoPath: "lib/images/whatsapp.webp"),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          // Copy Link Button
          ButtonWithIcon(
            textAndIconColor: primaryPurpleColor,
            buttonText: "Copy Link",
            onTap: () {
              Clipboard.setData(ClipboardData(text: inviteLink));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  backgroundColor: primaryPurpleColor,
                  content: Text(
                    'Link copied to clipboard',
                    style: GoogleFonts.montserrat(
                        fontSize: 19.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              );
            },
            borderColor: primaryPurpleColor,
            iconData: Icon(
              Icons.copy,
              color: primaryPurpleColor,
              size: 30,
            ),
          ),
        ],
      )),
    );
  }
}
