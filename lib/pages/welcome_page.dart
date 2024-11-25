import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:patidayanisma/components/welcome_buttons.dart';
import 'package:patidayanisma/main.dart';
import 'package:patidayanisma/pages/homepage.dart';
import 'package:patidayanisma/pages/login_email.dart';
import 'package:patidayanisma/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // Google Sign
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
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            // Image
            Image.asset(
              "lib/images/welcome-pet.png",
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 20),
            // First Heading
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Pet Network",
                    style: GoogleFonts.lato(
                        fontSize: 36,
                        color: primaryPurpleColor,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            // Second Heading
            Text("Animal Lovers Meeting Point",
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: primaryPurpleColor,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            // Paragraph
            Text(
                "All in one application for your animal and yourself.",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    height: 1.6,
                    color: primaryTextColor,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 25),
            // Login with Email
            WelcomeButtons(
              mainColor: primaryBlueColor,
              iconImage: Image.asset(
                "lib/images/email-transparent.png",
                width: 44,
                height: 44,
              ),
              buttonText: "Login with E-Mail",
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const LoginEmail(),
                    opaque: false,
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            // Register with google
            WelcomeButtons(
              onTap: () async {
                final GoogleSignInAccount? googleUser =
                    await _googleSignIn.signIn();
                if (googleUser?.email != null) {
                  authProvider.login();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  print(prefs.getBool('isAuthenticated'));
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Homepage(),
                      opaque: false,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red[700],
                      content: Text('Couldn\'t Sign in with Google',
                          style: GoogleFonts.montserrat(
                              fontSize: 18.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              mainColor: primaryPurpleColor,
              iconImage: Image.asset(
                "lib/images/google.png",
                width: 44,
                height: 44,
              ),
              buttonText: "Login with Google",
            ),
          ],
        ),
      ),
    );
  }
}
