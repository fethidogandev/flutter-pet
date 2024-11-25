import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendsUserBottomSheet extends StatelessWidget {
  final void Function() onUserDelete;
  final void Function() onUserBan;
  const FriendsUserBottomSheet(
      {super.key, required this.onUserDelete, required this.onUserBan});

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
              onTap: onUserDelete,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(255, 253, 78, 134),
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
                      Text("Arkadaşlıktan sil",
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 253, 78, 134),
                              fontWeight: FontWeight.w600)),
                      Image.asset(
                        "lib/images/delete-user.png",
                        height: 40,
                        width: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: onUserBan,
              child: Container(
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
                      Text("Engelle",
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 207, 31, 37),
                              fontWeight: FontWeight.w600)),
                      Image.asset(
                        "lib/images/banned-users.png",
                        height: 40,
                        width: 40,
                      ),
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
