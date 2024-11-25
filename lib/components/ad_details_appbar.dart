import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class AdDetailsAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String adCategory;
  final bool isAdOwner;
  final void Function() showOptions;
  final void Function() showReportOptions;
  const AdDetailsAppbar(
      {super.key,
      required this.isAdOwner,
      required this.showOptions,
      required this.showReportOptions,
      required this.adCategory});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      title: Text(
        adCategory,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          color: primaryPurpleColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.share,
            color: primaryPurpleColor,
            size: 30,
          ),
          onPressed: () {},
        ),
        Stack(
          children: [
            isAdOwner
                ? GestureDetector(
                    onTap: showOptions,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.more_vert,
                        size: 36,
                        color: primaryPurpleColor,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: IconButton(
                      icon: Image.asset(
                        "lib/images/question.png",
                        scale: 1.3,
                      ),
                      onPressed: showReportOptions,
                    ),
                  ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
