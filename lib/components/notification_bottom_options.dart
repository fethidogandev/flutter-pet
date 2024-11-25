import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationBottomOptions extends StatelessWidget {
  final void Function() onTap;
  const NotificationBottomOptions({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
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
                Text("Bildirimi Sil",
                    style: GoogleFonts.montserrat(
                        fontSize: 17,
                        color: const Color.fromARGB(255, 207, 31, 37),
                        fontWeight: FontWeight.w700)),
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
    );
  }
}
