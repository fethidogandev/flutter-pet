import 'package:flutter/material.dart';
import 'package:patidayanisma/components/small_category_buttons.dart';
import 'package:patidayanisma/theme/colors.dart';

class FilterAndSubmit extends StatelessWidget {
  final void Function() onTapFilter;
  final void Function() onTapSubmit;
  const FilterAndSubmit(
      {super.key, required this.onTapFilter, required this.onTapSubmit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmallCategoryButtons(
          onTap: onTapFilter,
          mainColor: primaryBlueColor,
          buttonImage: Image.asset(
            "lib/images/filter.png",
            height: 32,
            width: 32,
          ),
          buttonText: "Filter",
        ),
        SmallCategoryButtons(
          onTap: onTapSubmit,
          mainColor: primaryPurpleColor,
          buttonImage: Image.asset(
            "lib/images/done.png",
            height: 34,
            width: 34,
          ),
          buttonText: "Submit Ad",
        ),
      ],
    );
  }
}
