import 'package:flutter/material.dart';
import 'package:patidayanisma/components/text_icon_circle_button.dart';

class AdDetailsReportOptions extends StatelessWidget {
  final void Function(BuildContext context) reportModal;
  final void Function(BuildContext context) userReportModal;
  const AdDetailsReportOptions(
      {super.key, required this.reportModal, required this.userReportModal});

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
            TextIconCircleButton(
              onTap: () {
                reportModal(context);
              },
              borderColor: Colors.yellow[900]!,
              buttonText: "Report Ad",
              iconData: Icon(
                Icons.report,
                size: 40,
                color: Colors.yellow[900]!,
              ),
            ),
            const SizedBox(height: 10),
            TextIconCircleButton(
              onTap: () {
                userReportModal(context);
              },
              borderColor: Colors.orange.shade900,
              buttonText: "Report User",
              iconButton: IconButton(
                icon: Image.asset(
                  "lib/images/report-user2.png",
                  scale: 1.2,
                ),
                onPressed: () {
                  userReportModal(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
