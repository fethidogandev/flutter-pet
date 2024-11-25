import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/pages/homepage.dart';
import 'package:patidayanisma/theme/colors.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  int selectedIndex;
  final void Function(int index)? onTap;
  BottomNavigation({
    super.key,
    required this.selectedIndex,
    this.onTap,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  String _getPage(int index) {
    switch (index) {
      case 0:
        return "/";
      case 1:
        return "/myads";
      case 2:
        return "/friends";
      case 3:
        return "/profile";
      default:
        return "/";
    }
  }

  // This One goes mainscreen when back button
  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        widget.selectedIndex = 0;
      });
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
        (route) => false, // Prevent going back
      );
    } else {
      setState(() {
        widget.selectedIndex = index;
        Navigator.pushNamed(context, _getPage(index));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          widget.selectedIndex = 0;
        });
        _onItemTapped(0);
        return false;
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: primaryPurpleColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 5),
                child: Icon(
                  Icons.home_filled,
                  size: 35,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 5),
                child: Icon(
                  Icons.pets,
                  size: 35,
                ),
              ),
              label: 'My Ads',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 5),
                child: Icon(
                  Icons.people_alt,
                  size: 35,
                ),
              ),
              label: 'Friends',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 5),
                child: Icon(
                  Icons.person,
                  size: 35,
                ),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: widget.selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
          selectedLabelStyle: GoogleFonts.montserrat(
              fontSize: 13.5, color: Colors.white, fontWeight: FontWeight.w700),
          unselectedLabelStyle: GoogleFonts.montserrat(
              fontSize: 13.5, color: Colors.white, fontWeight: FontWeight.w500),
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
