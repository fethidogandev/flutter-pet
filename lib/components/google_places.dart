import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class GooglePlaces extends StatelessWidget {
  final TextEditingController controller;
  final BoxDecoration boxDecoration;
  final InputDecoration inputDecoration;
  final int debounceTime;
  final bool isLatLngRequired;
  final Function(Prediction) getPlaceDetailWithLatLng;
  final Function(Prediction) itemClick;
  final Widget seperatedBuilder;
  final double containerHorizontalPadding;
  final Widget Function(BuildContext, int, Prediction) itemBuilder;
  final bool isCrossBtnShown;
  const GooglePlaces(
      {super.key,
      required this.controller,
      required this.boxDecoration,
      required this.inputDecoration,
      required this.debounceTime,
      required this.isLatLngRequired,
      required this.getPlaceDetailWithLatLng,
      required this.itemClick,
      required this.seperatedBuilder,
      required this.containerHorizontalPadding,
      required this.itemBuilder,
      required this.isCrossBtnShown});

  @override
  Widget build(BuildContext context) {
    return GooglePlaceAutoCompleteTextField(
      textEditingController: controller,
      googleAPIKey: "",
      boxDecoration: boxDecoration,
      inputDecoration: inputDecoration,
      debounceTime: debounceTime,
      isLatLngRequired: isLatLngRequired,
      getPlaceDetailWithLatLng: getPlaceDetailWithLatLng,
      itemClick: itemClick,
      seperatedBuilder: seperatedBuilder,
      containerHorizontalPadding: containerHorizontalPadding,
      itemBuilder: itemBuilder,
      isCrossBtnShown: isCrossBtnShown,
    );
  }
}
