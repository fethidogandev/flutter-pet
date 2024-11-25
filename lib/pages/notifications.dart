import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/notification_bottom_options.dart';
import 'package:patidayanisma/components/notification_dismiss_container.dart';
import 'package:patidayanisma/theme/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  // User Image
  final String imageUrl = "lib/images/profile.jpg";

  // Notification Options
  void showNotificationOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return NotificationBottomOptions(
          onTap: () {},
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
        title: Text("Notifications",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: GestureDetector(
            onLongPress: () {
              showNotificationOptions();
            },
            // Dissmissible
            child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {},
              child: NotificationDismissContainer(
                  description:
                      "Lorem ipsum dolor sit amet asdasd asdasa asd asda sdas aaaassdas",
                  date: "12.1.2024",
                  time: "13:13",
                  iconData: Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.amber[700],
                    size: 40,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
