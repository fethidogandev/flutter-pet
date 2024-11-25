import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/pages/message_inbox.dart';
import 'package:patidayanisma/theme/colors.dart';

class MessageBoxComp extends StatelessWidget {
  final void Function() showDelete;
  final void Function() redirectToConversation;
  final void Function() redirectToUserProfile;
  final void Function(DismissDirection direction) dissmisFunc;
  final String imageUrl;
  final String username;
  final String message;
  final bool isMessageRead;

  const MessageBoxComp(
      {super.key,
      required this.showDelete,
      required this.dissmisFunc,
      required this.imageUrl,
      required this.username,
      required this.message,
      required this.isMessageRead,
      required this.redirectToConversation,
      required this.redirectToUserProfile});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: dissmisFunc,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: isMessageRead
                ? Colors.white
                : const Color.fromARGB(18, 33, 150, 243),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: primaryPurpleColor,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Row(
              children: [
                GestureDetector(
                  onTap: redirectToUserProfile,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(imageUrl),
                  ),
                ),
                GestureDetector(
                  onLongPress: showDelete,
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const MessageInbox(),
                        opaque: false,
                      ),
                    );
                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(username,
                                style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    color: primaryPurpleColor,
                                    fontWeight: FontWeight.w600)),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Image.asset(
                                "lib/images/crown.png",
                                height: 20,
                                width: 20,
                              ),
                            )
                          ]),
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width * 65) / 100,
                            child: Text(message,
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: isMessageRead
                                        ? primaryTextColor
                                        : primaryBlueColor,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      )),
                ),
                !isMessageRead
                    ? GestureDetector(
                        onTap: redirectToConversation,
                        child: Container(
                          height: 15,
                          width: 15,
                          margin: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              color: primaryBlueColor,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
