import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/theme/colors.dart';

class MessageBubble extends StatelessWidget {
  final ScrollController scrollController;
  final List<Map<String, dynamic>> messages;
  const MessageBubble(
      {super.key, required this.scrollController, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          var message = messages[index];
          return Column(
            children: [
              Align(
                alignment: message['isUser']
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Padding(
                  padding: message['isUser']
                      ? const EdgeInsets.only(left: 50, right: 8, bottom: 8)
                      : const EdgeInsets.only(left: 8, right: 50, bottom: 8),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: message['isUser']
                          ? primaryPurpleColor
                          : Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(message['isUser'] ? 16 : 0),
                        topRight: Radius.circular(message['isUser'] ? 0 : 16),
                        bottomLeft: const Radius.circular(16),
                        bottomRight: const Radius.circular(16),
                      ),
                    ),
                    child: Text(
                      message['text'],
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: message['isUser'] ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: message['isUser']
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Text(
                    message['timestamp'],
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: primaryGreenColor,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
