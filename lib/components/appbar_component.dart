import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/pages/message_box.dart';
import 'package:patidayanisma/pages/notifications.dart';
import 'package:patidayanisma/theme/colors.dart';

class AppbarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int? numberOfMessages;
  final int? numberOfNotifications;
  final Color? backgroundColor;
  final bool implyLeading;
  final bool showMessageIcon;
  final bool showNotificationIcon;

  const AppbarComponent({
    super.key,
    required this.title,
    this.backgroundColor,
    this.numberOfMessages,
    this.numberOfNotifications,
    required this.showNotificationIcon,
    required this.implyLeading,
    required this.showMessageIcon,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];

    if (showNotificationIcon) {
      actions.addAll([
        Stack(
          children: [
            IconButton(
              icon: Image.asset(
                "lib/images/bell.png",
                height: 32,
                width: 32,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const Notifications(),
                    opaque: false,
                  ),
                );
              },
            ),
            Positioned(
              top: -5,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const Notifications(),
                      opaque: false,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    color: primaryGreenColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(numberOfNotifications.toString(),
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ],
        ),
      ]);
    }
    if (showMessageIcon) {
      actions.addAll([
        const SizedBox(width: 8),
        Stack(
          children: [
            IconButton(
              icon: Image.asset(
                "lib/images/message.png",
                height: 32,
                width: 32,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const MessageBox(),
                    opaque: false,
                  ),
                );
              },
            ),
            Positioned(
              top: -5,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MessageBox(),
                      opaque: false,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    color: primaryGreenColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(numberOfMessages.toString(),
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ],
        ),
      ]);
    }

    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      automaticallyImplyLeading: implyLeading,
      iconTheme: IconThemeData(color: primaryGreenColor, size: 30),
      title: Text(title,
          style: GoogleFonts.montserrat(
              fontSize: 20,
              color: primaryPurpleColor,
              fontWeight: FontWeight.w500)),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
