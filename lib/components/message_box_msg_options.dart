import 'package:flutter/material.dart';
import 'package:patidayanisma/components/text_icon_circle_button.dart';
import 'package:patidayanisma/theme/colors.dart';

class MessageBoxMsgOptions extends StatelessWidget {
  final void Function() readMessage;
  final void Function() deleteMessage;
  const MessageBoxMsgOptions(
      {super.key, required this.readMessage, required this.deleteMessage});

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
                onTap: readMessage,
                borderColor: primaryBlueColor,
                buttonText: "Mark as read",
                iconData: Icon(
                  Icons.mark_chat_read,
                  size: 40,
                  color: primaryBlueColor,
                )),
            const SizedBox(height: 15),
            TextIconCircleButton(
                onTap: deleteMessage,
                borderColor: Colors.orange.shade900,
                buttonText: "Delete Message",
                iconData: Icon(
                  Icons.delete,
                  size: 40,
                  color: Colors.yellow[900]!,
                )),
          ],
        ),
      ),
    );
  }
}
