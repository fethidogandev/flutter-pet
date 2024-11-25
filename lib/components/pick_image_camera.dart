import 'package:flutter/material.dart';
import 'package:patidayanisma/theme/colors.dart';

class PickImageCamera extends StatelessWidget {
  final void Function() onTap;
  const PickImageCamera({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: primaryBlueColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: primaryBlueColor,
          ),
        ),
        child: const Icon(
          Icons.camera,
          color: Colors.white,
          size: 31,
        ),
      ),
    );
  }
}
