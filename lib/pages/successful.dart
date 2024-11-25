import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/appbar_component.dart';
import 'package:patidayanisma/components/button_with_text.dart';
import 'package:patidayanisma/pages/homepage.dart';
import 'package:patidayanisma/theme/colors.dart';

class Successful extends StatefulWidget {
  const Successful({super.key});

  @override
  _SuccessfulState createState() => _SuccessfulState();
}

class _SuccessfulState extends State<Successful> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        // Appbar
        appBar: AppbarComponent(
          title: "",
          implyLeading: false,
          backgroundColor: backgroundColor,
          showMessageIcon: false,
          showNotificationIcon: false,
        ),
        backgroundColor: backgroundColor,
        // Body
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Verified Image
              Image.asset(
                "lib/images/verified-check.webp",
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 15),
              // Heading
              Text(
                "We've received your ad.",
                style: GoogleFonts.montserrat(
                    fontSize: 22,
                    color: primaryPurpleColor,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              // Description
              Text(
                "Thanks. We've received your ad and your ad will be visible after moderation process. You can see your ad under My Ads after its approved.",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: primaryTextColor,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              // Redirect Button
              ButtonWithText(
                  buttonFunc: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const Homepage(),
                        opaque: false,
                      ),
                    );
                  },
                  buttonName: "Go To Home"),
            ],
          ),
        )),
      ),
    );
  }
}
