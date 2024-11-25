import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowUs extends StatelessWidget {
  final String link;
  final String imagePath;
  const FollowUs({super.key, required this.link, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(link);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
