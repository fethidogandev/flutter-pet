import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/pages/message_inbox.dart';
import 'package:patidayanisma/theme/colors.dart';

class AddFriendAndMessage extends StatelessWidget {
  final bool isFriend;
  final void Function() addToFriend;
  final void Function() removeFriend;
  const AddFriendAndMessage(
      {super.key,
      required this.isFriend,
      required this.addToFriend,
      required this.removeFriend});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: isFriend ? removeFriend : addToFriend,
            child: Container(
              width: ((MediaQuery.of(context).size.width / 2) * 90) / 100,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: isFriend ? Colors.red[700]! : primaryPurpleColor,
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
                    Flexible(
                      child: Text(
                          isFriend ? "Arkadaşlıkdan Çıkart" : "Arkadaş Ekle",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: isFriend
                                  ? Colors.red[700]
                                  : primaryPurpleColor,
                              fontWeight: FontWeight.w600)),
                    ),
                    isFriend
                        ? Image.asset(
                            "lib/images/delete-user.png",
                            height: 34,
                            width: 34,
                          )
                        : Image.asset(
                            "lib/images/add-friend.png",
                            height: 34,
                            width: 34,
                          ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
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
              width: ((MediaQuery.of(context).size.width / 2) * 90) / 100,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: primaryBlueColor,
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
                    Text("Mesaj",
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: primaryBlueColor,
                            fontWeight: FontWeight.w600)),
                    Image.asset(
                      "lib/images/send-message.png",
                      height: 32,
                      width: 32,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
