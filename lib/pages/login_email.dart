import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/button_with_icon.dart';
import 'package:patidayanisma/pages/pin_verification.dart';
import 'package:patidayanisma/pages/tos.dart';
import 'package:patidayanisma/theme/colors.dart';
import 'package:http/http.dart' as http;

class LoginEmail extends StatefulWidget {
  const LoginEmail({super.key});

  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  // Formkey
  final _formKey = GlobalKey<FormState>();

  // Text Editing Controller
  TextEditingController _emailController = TextEditingController();

  // InputFormatters
  late TextInputFormatter _emailInputFormatter;

  // Initstate
  @override
  void initState() {
    super.initState();
    // Initialize the input formatter to remove whitespace characters
    _emailInputFormatter =
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]'));
  }

  // Disposal
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Validations
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please type an E-Mail address';
    }
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please type a valid E-Mail address';
    }
    return null;
  }

  // Email Domains
  List<String> emailDomains = [
    "gmail.com",
    "outlook.com",
    "hotmail.com",
    "icloud.com"
  ];

  // Suggested Domains
  List<String> suggestedDomains = [];

  // Update domain suggestions
  void _updateSuggestions(String value) {
    String currentText = value.substring(value.indexOf('@') + 1);
    setState(() {
      suggestedDomains = emailDomains
          .where((domain) => domain.startsWith(currentText))
          .toList();
    });
  }

  // Domain suggesstions
  void _selectSuggestion(String suggestion) {
    String currentText = _emailController.text;
    int atIndex = currentText.indexOf('@');
    String newText = currentText.substring(0, atIndex + 1) + suggestion;
    _emailController.text = newText;
    setState(() {
      suggestedDomains = [];
    });
  }

  // Sample api request
  Future<void> makeApiRequest(String email) async {
    try {
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        // Handle successful API response
        print('API request successful');
        print(response.body);
      } else {
        // Handle API request failure
        print('API request failed');
        print('Status code: ${response.statusCode}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red[700],
          content: Text('Email ile giriş gerçekleşmedi!',
              style: GoogleFonts.montserrat(
                  fontSize: 18.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
          duration: const Duration(seconds: 2),
        ),
      );
    }
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
        title: Text("Email ile giriş",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: backgroundColor,
      // Body
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  // Email Input
                  TextFormField(
                    inputFormatters: [_emailInputFormatter],
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "E-Posta",
                      focusColor: Colors.blue,
                      prefixIconConstraints: const BoxConstraints(minWidth: 58),
                      prefixIcon: Image.asset(
                        "lib/images/email-transparent.png",
                        width: 44,
                        height: 44,
                      ),
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 33, 150, 243),
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 33, 150, 243),
                          width: 2,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 153, 72, 255),
                          width: 2,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 33, 150, 243),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                    style: GoogleFonts.montserrat(
                        fontSize: 16.5,
                        color: primaryPurpleColor,
                        fontWeight: FontWeight.w600),
                    validator: _validateEmail,
                    onChanged: (value) {
                      if (value.contains('@')) {
                        _updateSuggestions(value);
                      }
                      String domain = value.split('@').last;
                      if (emailDomains.contains(domain) || value.isEmpty) {
                        setState(() {
                          suggestedDomains = [];
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  // Domain Suggestions
                  Column(
                    children: [
                      for (int i = 0; i < suggestedDomains.length; i += 2)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              for (int j = i;
                                  j < i + 2 && j < suggestedDomains.length;
                                  j++)
                                GestureDetector(
                                  onTap: () {
                                    _selectSuggestion(suggestedDomains[j]);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(11.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: primaryPurpleColor),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Text(suggestedDomains[j],
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            color: primaryPurpleColor,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  // Registration Text
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "With registration you are accepting",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: " Terms of service",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Tos()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Login Button
                  ButtonWithIcon(
                      textAndIconColor: primaryPurpleColor,
                      iconData: Icon(
                        Icons.arrow_forward_ios,
                        color: primaryPurpleColor,
                        size: 30,
                      ),
                      buttonText: "Login",
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await makeApiRequest(_emailController.text);
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const PinVerification(),
                              opaque: false,
                            ),
                          );
                        }
                      },
                      borderColor: primaryPurpleColor),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
