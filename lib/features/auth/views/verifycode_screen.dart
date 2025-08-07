import 'package:flutter/material.dart';
import 'package:notoan/components/widgets/registerSuccessBottomSheet.dart';
import 'package:notoan/components/widgets/rounded_button.dart';
import 'package:notoan/utils/constants/fonts.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class VerifycodeScreen extends StatelessWidget {
  const VerifycodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Verification",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: AppFonts.outfit,
          ),
        ),
      ),
      body: VerifyCodePage(),
    );
  }
}

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({super.key});

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  String _code = '';
  bool _onEditing = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        // Ensures screen is scrollable on small devices
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Divider(),
            const SizedBox(height: 40),
            Center(child: Image.asset("assets/images/verifycode.png")),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Verification Code",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: AppFonts.outfit,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Text(
                "Enter the verification code sent to your email.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                  fontFamily: AppFonts.outfit,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Code Input Field
            VerificationCode(
              textStyle: const TextStyle(fontSize: 20.0, color: Colors.black),
              keyboardType: TextInputType.number,
              underlineColor: const Color(0xFF479C2B), // green underline
              length: 4,
              cursorColor: const Color(0xFF479C2B),
              onCompleted: (String value) {
                setState(() {
                  _code = value;
                });
              },
              onEditing: (bool value) {
                setState(() {
                  _onEditing = value;
                });
              },
            ),
            const SizedBox(height: 40),

            // Verify Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed:
                      _code.length == 4
                          ? () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder:
                                  (context) =>
                                      const RegisterSuccessBottomSheet(),
                            );

                            Future.delayed(const Duration(seconds: 2), () {
                              Navigator.pushNamed(context, '/login');
                            });

                            print("Code entered: $_code");
                          }
                          : null,
                  // Disable button if code isn't complete
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF479C2B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            // Resend Code Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive the code?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF479C2B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  child: const Text(
                    "Resend",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF479C2B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
