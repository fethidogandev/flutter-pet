import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class MyAdsOptionsBottomSheet extends StatelessWidget {
  final void Function() editAd;
  final void Function() deleteAd;
  const MyAdsOptionsBottomSheet(
      {super.key, required this.editAd, required this.deleteAd});

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
            GestureDetector(
              onTap: editAd,
              child: Container(
                width: 180,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: primaryBlueColor,
                    ),
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Edit Ad",
                          style: GoogleFonts.montserrat(
                              fontSize: 17,
                              color: primaryBlueColor,
                              fontWeight: FontWeight.w600)),
                      Icon(
                        Icons.edit_outlined,
                        size: 40,
                        color: primaryBlueColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: deleteAd,
              child: Container(
                width: 180,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(255, 207, 31, 37),
                    ),
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delete Ad",
                          style: GoogleFonts.montserrat(
                              fontSize: 17,
                              color: const Color.fromARGB(255, 207, 31, 37),
                              fontWeight: FontWeight.w600)),
                      const Icon(
                        Icons.delete_outline_rounded,
                        size: 40,
                        color: Color.fromARGB(255, 207, 31, 37),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
