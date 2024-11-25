import 'package:flutter/material.dart';
import 'package:patidayanisma/pages/ad_details_mating.dart';
import 'package:patidayanisma/pages/friends.dart';
import 'package:patidayanisma/pages/homepage.dart';
import 'package:patidayanisma/pages/my_ads.dart';
import 'package:patidayanisma/pages/profile.dart';
import 'package:patidayanisma/pages/submit_adoption_ads.dart';
import 'package:patidayanisma/pages/submit_mating_ads.dart';
import 'package:patidayanisma/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            SharedPreferences prefs = snapshot.data!;
            return ChangeNotifierProvider(
              create: (context) => AuthProvider(prefs),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: AuthenticationWrapper(),
                routes: {
                  "/welcomepage": (context) => const WelcomePage(),
                  "/homepage": (context) => const Homepage(),
                  "/myads": (context) => const MyAds(),
                  "/friends": (context) => const Friends(),
                  "/profile": (context) => const Profile(),
                },
              ),
            );
          } else {
            return const CircularProgressIndicator(); // or some loading indicator
          }
        });
  }
}

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  SharedPreferences _prefs;

  AuthProvider(this._prefs) {
    _isAuthenticated = _prefs.getBool('isAuthenticated') ?? false;
  }

  bool get isAuthenticated => _isAuthenticated;

  void login() async {
    _isAuthenticated = true;
    _prefs.setBool('isAuthenticated', true);
    notifyListeners();
  }

  void logout() async {
    _isAuthenticated = false;
    _prefs.setBool('isAuthenticated', false);
    notifyListeners();
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return authProvider.isAuthenticated
        ? const Homepage()
        : const WelcomePage();
  }
}
