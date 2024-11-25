import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/user_component.dart';
import 'package:patidayanisma/pages/userprofile.dart';
import 'package:patidayanisma/theme/colors.dart';

class BannedUsers extends StatefulWidget {
  const BannedUsers({super.key});

  @override
  _BannedUsersState createState() => _BannedUsersState();
}

class _BannedUsersState extends State<BannedUsers> {
  // User Image
  final String imageUrl = "lib/images/welcome-pet.png";

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
        title: Text("Banned Users",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: UserComponent(
            username: "Antique_giraffe_3728",
            imageUrl: imageUrl,
            numOfAds: "15",
            iconData: Image.asset(
              "lib/images/delete-user.png",
              height: 50,
              width: 50,
            ),
            redirectToUser: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const UserProfile(),
                  opaque: false,
                ),
              );
            },
            iconFunction: () {},
          ),
        ),
      ),
    );
  }
}
