import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/message_box_component.dart';
import 'package:patidayanisma/components/message_box_msg_options.dart';
import 'package:patidayanisma/pages/message_inbox.dart';
import 'package:patidayanisma/pages/userprofile.dart';
import 'package:patidayanisma/theme/colors.dart';

class MessageBox extends StatefulWidget {
  const MessageBox({super.key});

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  // Variables
  final String imageUrl = "lib/images/welcome-pet.png";
  bool isMessageRead = false;

  // Show Message Options
  void _showDeleteBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return MessageBoxMsgOptions(
          readMessage: () {},
          deleteMessage: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: primaryPurpleColor,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: primaryPurpleColor, size: 30),
        title: Text("Messages",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
          child:
              // Individual Messages
              MessageBoxComp(
        showDelete: _showDeleteBottomSheet,
        dissmisFunc: (direction) {},
        imageUrl: imageUrl,
        username: "fethidodo",
        message: "anlamıyom gardaşım bu ne boyle bea",
        isMessageRead: isMessageRead,
        redirectToConversation: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const MessageInbox(),
              opaque: false,
            ),
          );
        },
        redirectToUserProfile: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const UserProfile(),
              opaque: false,
            ),
          );
        },
      )),
    );
  }
}
