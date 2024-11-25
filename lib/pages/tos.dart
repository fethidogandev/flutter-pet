import 'package:flutter/material.dart';
import 'package:patidayanisma/components/appbar_component.dart';
import 'package:patidayanisma/components/tos_text.dart';
import 'package:patidayanisma/theme/colors.dart';

class Tos extends StatefulWidget {
  const Tos({super.key});

  @override
  _TosState createState() => _TosState();
}

class _TosState extends State<Tos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppbarComponent(
        title: "Tos",
        implyLeading: true,
        backgroundColor: backgroundColor,
        showMessageIcon: false,
        showNotificationIcon: false,
      ),
      backgroundColor: backgroundColor,
      // Body
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOS Component
            TosText(
                text:
                    "1-) Some rule will be added here"),
            SizedBox(height: 10),
          ],
        ),
      )),
    );
  }
}
