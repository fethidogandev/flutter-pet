import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/message_bubble.dart';
import 'package:patidayanisma/theme/colors.dart';

class MessageInbox extends StatefulWidget {
  const MessageInbox({Key? key}) : super(key: key);

  @override
  _MessageInboxState createState() => _MessageInboxState();
}

class _MessageInboxState extends State<MessageInbox> {
  // Controllers
  ScrollController _scrollController = ScrollController();
  TextEditingController _messageController = TextEditingController();

  // User Image
  final String imageUrl = "lib/images/welcome-pet.png";

  // Variables
  final String username = "message_to_user";

  // Initstate
  @override
  void initState() {
    super.initState();
    // Scroll to the bottom when the widget first loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  // Message List
  List<Map<String, dynamic>> messages = [
    {
      'text':
          "Hello, how are you? I hope everything is going well for you. Just wanted to check in and see how you've been doing lately. It's been quite some time since we last spoke.",
      'timestamp': "12.10.2024 20:11",
      'isUser': false,
    },
    {
      'text':
          "Yes, it's been a while indeed. I've been doing okay, just been busy with work and personal stuff. How about you? How's everything going on your end?",
      'timestamp': "12.10.2024 20:13",
      'isUser': true,
    },
    {
      'text':
          "Yes, it's been a while indeed. I've been doing okay, just been busy with work and personal stuff. How about you? How's everything going on your end?",
      'timestamp': "12.10.2024 20:15",
      'isUser': false,
    },
  ];

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
        // Username
        title: Text(username,
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
        actions: [
          // User Image
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(imageUrl),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      // Body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MessageBubble(
              scrollController: _scrollController, messages: messages),
          // Message Field & Send Container
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 11, right: 11, top: 15, bottom: 15),
              child: Row(
                children: [
                  // Message Field
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 3,
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'Type Message...',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 33, 150, 243),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 33, 150, 243),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 153, 72, 255),
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 33, 150, 243),
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        style: GoogleFonts.montserrat(
                            fontSize: 17,
                            color: primaryPurpleColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  // Send Message Button
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: primaryPurpleColor,
                      size: 36,
                    ),
                    onPressed: () {
                      // Implement sending functionality here
                      String messageText = _messageController.text;
                      // Create a new message object
                      Map<String, dynamic> newMessage = {
                        'text': messageText,
                        'timestamp': DateTime.now().toString(),
                        'isUser': true,
                      };
                      // Add the new message to the list
                      setState(() {
                        messages.add(newMessage);
                      });
                      // Clear the message field after sending
                      _messageController.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
