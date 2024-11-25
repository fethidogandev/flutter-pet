import 'package:flutter/material.dart';

class InviteSocialButtons extends StatelessWidget {
  final void Function() launchSocial;
  final String logoPath;
  const InviteSocialButtons(
      {super.key, required this.launchSocial, required this.logoPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: launchSocial,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(logoPath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
