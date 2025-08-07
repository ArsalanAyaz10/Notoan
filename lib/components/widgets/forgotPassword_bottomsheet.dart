import 'package:flutter/material.dart';
import 'package:notoan/components/widgets/custom_textField.dart';
import 'package:notoan/components/widgets/rounded_button.dart';
import 'package:notoan/utils/constants/colors.dart';
import 'package:notoan/utils/constants/fonts.dart';

class ForgotPasswordBottomSheet extends StatelessWidget {
  const ForgotPasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Container(
      color: Colors.white, // background color white
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom:
              MediaQuery.of(context).viewInsets.bottom +
              40, // more bottom space
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start, // align top left
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),

            const Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.outfit,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Enter your email or phone number",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.grey,
                fontFamily: AppFonts.outfit,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Email or Phone Number",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.outfit,
              ),
            ),
            const SizedBox(height: 10),

            CustomTextField(
              controller: emailController,
              leadingIcon: Icons.mail_outline,
              hintText: "example@mail.com",
              trailing: Icon(
                Icons.check_circle_outline,
                color: AppColors.primaryGreen,
              ),
            ),

            const SizedBox(height: 30),

            Center(
              child: RoundedButton(
                text: "Send Code",
                verticalPadding: 15,
                horizontalPadding: 130,
                onPressed: () {
                  Navigator.pop(context);
                  //Navigator.pop(context); // Close sheet after sending
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
