import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patidayanisma/components/button_with_icon.dart';
import 'package:patidayanisma/main.dart';
import 'package:patidayanisma/pages/homepage.dart';
import 'package:patidayanisma/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class PinVerification extends StatefulWidget {
  const PinVerification({Key? key}) : super(key: key);

  @override
  _PinVerificationState createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {
  // Text Editing Controller
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  // Focus Node
  List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  // Authprovider
  late AuthProvider authProvider;

  // Initstate
  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  // Api Reques
  Future<void> makeApiRequest(String pin) async {
    try {
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: {
          'pin': pin,
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
        iconTheme: IconThemeData(color: primaryGreenColor, size: 30),
        automaticallyImplyLeading: false,
        title: Text("Pin Doğrulama",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: primaryPurpleColor,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: backgroundColor,
      // Body
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Pin Verification Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryBlueColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        _controllers[index].clear();
                      },
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        obscureText: false,
                        maxLength: 1,
                        onTap: () {
                          _controllers[index].clear();
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index + 1]);
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index - 1]);
                          }
                        },
                        decoration: const InputDecoration(
                          counter: Offstage(),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Verify Pin Button
              ButtonWithIcon(
                  textAndIconColor: primaryPurpleColor,
                  buttonText: "Pini Doğrula",
                  onTap: () async {
                    bool allFieldsFilled = true;
                    for (var controller in _controllers) {
                      if (controller.text.isEmpty) {
                        allFieldsFilled = false;
                        break;
                      }
                    }

                    String pin = _controllers
                        .map((controller) => controller.text)
                        .join();
                    if (allFieldsFilled) {
                      // You can get the entered PIN from _controllers[index].text
                      await makeApiRequest(pin);
                      authProvider.login();
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Homepage(),
                          opaque: false,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Lütfen Pini giriniz.',
                              style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  borderColor: primaryPurpleColor),
            ],
          ),
        ),
      ),
    );
  }

  // Disposal
  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
