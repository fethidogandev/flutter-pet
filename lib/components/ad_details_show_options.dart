import 'package:flutter/material.dart';
import 'package:patidayanisma/components/text_icon_circle_button.dart';
import 'package:patidayanisma/theme/colors.dart';

class AdDetailsShowOptions extends StatelessWidget {
  final void Function() redirectEditAd;
  final void Function() removeAd;
  const AdDetailsShowOptions({
    super.key,
    required this.redirectEditAd,
    required this.removeAd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextIconCircleButton(
                onTap: redirectEditAd,
                borderColor: primaryBlueColor,
                buttonText: "Edit Ad",
                iconData: Icon(
                  Icons.edit_outlined,
                  size: 40,
                  color: primaryBlueColor,
                )),
            const SizedBox(height: 10),
            TextIconCircleButton(
                onTap: removeAd,
                borderColor: const Color.fromARGB(255, 207, 31, 37),
                buttonText: "Remove Ad",
                iconData: const Icon(
                  Icons.delete_outline_rounded,
                  size: 40,
                  color: Color.fromARGB(255, 207, 31, 37),
                )),
          ],
        ),
      ),
    );
  }
}
