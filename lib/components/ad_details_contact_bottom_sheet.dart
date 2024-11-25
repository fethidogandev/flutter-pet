import 'package:flutter/material.dart';
import 'package:patidayanisma/components/text_icon_circle_button.dart';
import 'package:patidayanisma/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AdDetailsContactBottomSheet extends StatelessWidget {
  final String? telegram;
  final String? email;
  final String? facebook;
  final String? instagram;
  const AdDetailsContactBottomSheet(
      {super.key,
      required this.telegram,
      required this.email,
      required this.facebook,
      this.instagram});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Instagram
            TextIconCircleButton(
                onTap: () {
                  launch('https://www.instagram.com/$instagram');
                },
                borderColor: primaryBlueColor,
                buttonText: instagram!,
                iconData: Icon(
                  Icons.thumb_up_sharp,
                  size: 40,
                  color: primaryBlueColor,
                )),
            const SizedBox(height: 10),
            // Facebook
            TextIconCircleButton(
                onTap: () {
                  launch('https://facebook/$facebook');
                },
                borderColor: primaryBlueColor,
                buttonText: facebook!,
                iconData: Icon(
                  Icons.facebook,
                  size: 40,
                  color: primaryBlueColor,
                )),
            const SizedBox(height: 10),
            // Telegram
            TextIconCircleButton(
                onTap: () {
                  launch('https://t.me/$telegram');
                },
                borderColor: primaryBlueColor,
                buttonText: telegram!,
                iconData: Icon(
                  Icons.telegram,
                  size: 40,
                  color: primaryBlueColor,
                )),
            const SizedBox(height: 10),
            // E-Mail
            TextIconCircleButton(
                onTap: () {
                  launch("mailto:$email");
                },
                borderColor: primaryPurpleColor,
                buttonText: email!,
                iconData: Icon(
                  Icons.email,
                  size: 40,
                  color: primaryPurpleColor,
                )),
          ],
        ),
      ),
    );
  }
}
