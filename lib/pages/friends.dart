import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/appbar_component.dart';
import 'package:patidayanisma/components/bottom_navigation.dart';
import 'package:patidayanisma/components/friend_request.dart';
import 'package:patidayanisma/components/friends_switch_tabs.dart';
import 'package:patidayanisma/components/friends_user_bottom_sheet.dart';
import 'package:patidayanisma/components/user_component.dart';
import 'package:patidayanisma/components/username_field.dart';
import 'package:patidayanisma/pages/message_inbox.dart';
import 'package:patidayanisma/pages/userprofile.dart';
import 'package:patidayanisma/theme/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  // Variables
  int selectedIndex = 2;
  String? selectedShowType = "Friends";

  // User Image
  final String imageUrl = "lib/images/welcome-pet.png";

  // Text Controllers
  final TextEditingController _usernameController = TextEditingController();

  // Found Users
  List<String> foundUsers = [];

  // Fetch Users
  void fetchUsers(String query) async {
    String apiUrl =
        'https://jsonplaceholder.typicode.com/posts?title_like=$query';
    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        foundUsers.clear();
        for (var item in data) {
          foundUsers.add(item['title']);
        }
      });
    } else {
      print('Failed to fetch data');
    }
  }

  // Friend Options Bottom Sheet
  void showOptionsBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FriendsUserBottomSheet(
          onUserDelete: () {},
          onUserBan: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom Navbar
      bottomNavigationBar: BottomNavigation(selectedIndex: selectedIndex),
      // Appbar
      appBar: AppbarComponent(
        title: "Friends",
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
                  leftButtonText: "Friends",
                  rightButtonText: "Requests",
                  selectedShowType: selectedShowType!,
                  onTapFriends: () {
                    setState(() {
                      selectedShowType = "Friends";
                    });
                  },
                  onTapRequests: () {
                    setState(() {
                      selectedShowType = "Requests";
                    });
                  },
                  numberOfRequests: "4"),
              // Conditional Rendering For Switch
              selectedShowType == "Friends"
                  ?
                  // Friends
                  Column(
                      children: [
                        const SizedBox(height: 15),
                        // Search Users
                        UsernameField(
                          controller: _usernameController,
                          fieldText: "Search User",
                          onChange: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                foundUsers = [];
                              });
                            } else {
                              fetchUsers(value);
                            }
                          },
                        ),
                        // User Search results
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              foundUsers.length > 5 ? 5 : foundUsers.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  foundUsers = [];
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Text(
                                  foundUsers[index],
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: primaryBlueColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        // User Component
                        UserComponent(
                          username: "asdasdxxadsa_asdadas",
                          imageUrl: imageUrl,
                          numOfAds: "15",
                          onLongPress: showOptionsBottomSheet,
                          iconData: Image.asset(
                            "lib/images/send-message.png",
                            height: 50,
                            width: 50,
                          ),
                          redirectToUser: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const UserProfile(),
                                opaque: false,
                              ),
                            );
                          },
                          iconFunction: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const MessageInbox(),
                                opaque: false,
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  :
                  // Friend Requests
                  FriendRequest(
                      imageUrl: imageUrl,
                      isPremium: true,
                      acceptFunc: () {},
                      rejectFunc: () {},
                      username: "asdddxxasd"),
            ],
          ),
        ),
      ),
    );
  }
}
