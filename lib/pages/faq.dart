import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/faq_q_and_a.dart';
import 'package:patidayanisma/theme/colors.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  // Questions
  String firstQuestion = "Is it free to advertise ?";
  String secondQuestion = "I can't see my ad, Why ?";
  String thirdQuestion = "My ad is offline, Why?";
  String fifthQuestion = "I can't add users as friend and can't send message ?";

  // Answers
  String firstAnswer =
      "You can share an ad for free in the following categories: Adoption, Lost, Need";
  String secondAnswer =
      "After your ad is successfuly submitted our moderators will review your ad and if your ad is meet our criterias it will be approved by our moderation team. Your ad will be visible to all user after its approved.";
  String thirdAnswer =
      "There is a deadline for each ad category. \nAdoption Ad 2 Months \nNeed Ad 1 Week \nLost Ad 1 Week \nMating Ad 2 Months";
  String fifthAnswer =
      "Only premium users able to send message or add users as friend.";

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
        title: Text("FAQ",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FaqQandA(question: firstQuestion, answer: firstAnswer),
            FaqQandA(question: secondQuestion, answer: secondAnswer),
            FaqQandA(question: thirdQuestion, answer: thirdAnswer),
            FaqQandA(question: fifthQuestion, answer: fifthAnswer),
          ],
        ),
      )),
    );
  }
}
