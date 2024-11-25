import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class ShowListAndMap extends StatelessWidget {
  final void Function() onTapList;
  final void Function() onTapMap;
  final String showType;
  const ShowListAndMap({
    super.key,
    required this.onTapMap,
    required this.showType,
    required this.onTapList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTapList,
          child: Container(
            width: ((MediaQuery.of(context).size.width / 2) * 90) / 100,
            height: 50,
            decoration: BoxDecoration(
                color:
                    showType == "Listing" ? primaryPurpleColor : Colors.white,
                border: Border.all(
                  width: 2,
                  color:
                      showType == "Listing" ? Colors.white : primaryPurpleColor,
                ),
                borderRadius: BorderRadius.circular(40)),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Liste",
                      style: GoogleFonts.montserrat(
                          fontSize: 16.5,
                          color: showType == "Listing"
                              ? Colors.white
                              : primaryPurpleColor,
                          fontWeight: FontWeight.w600)),
                  Image.asset(
                    "lib/images/list-view.png",
                    height: 32,
                    width: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTapMap,
          child: Container(
            width: ((MediaQuery.of(context).size.width / 2) * 90) / 100,
            height: 50,
            decoration: BoxDecoration(
                color: showType == "Map" ? primaryPurpleColor : Colors.white,
                border: Border.all(
                  width: 2,
                  color: showType == "Map" ? Colors.white : primaryPurpleColor,
                ),
                borderRadius: BorderRadius.circular(40)),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Harita",
                      style: GoogleFonts.montserrat(
                          fontSize: 16.5,
                          color: showType == "Map"
                              ? Colors.white
                              : primaryPurpleColor,
                          fontWeight: FontWeight.w600)),
                  Icon(
                    Icons.location_on,
                    color:
                        showType == "Map" ? Colors.white : primaryPurpleColor,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
