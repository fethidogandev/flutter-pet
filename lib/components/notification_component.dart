import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class NotificationComp extends StatelessWidget {
  final String description;
  final String date;
  final String hour;
  final Icon iconData;
  final void Function(DismissDirection direction) dismissFunc;

  const NotificationComp({
    super.key,
    required this.description,
    required this.date,
    required this.hour,
    required this.iconData,
    required this.dismissFunc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bildirimi Sil",
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.w700)),
                        const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: dismissFunc,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.warning,
                      color: Colors.amber[700],
                      size: 35.0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(description,
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w500)),
                          Row(
                            children: [
                              Text(date,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.w600)),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(hour,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        letterSpacing: 2,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
