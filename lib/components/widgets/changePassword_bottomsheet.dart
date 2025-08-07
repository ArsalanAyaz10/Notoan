import 'package:flutter/material.dart';
import 'package:notoan/components/widgets/custom_textField.dart';
import 'package:notoan/components/widgets/rounded_button.dart';
import 'package:notoan/utils/constants/colors.dart';
import 'package:notoan/utils/constants/fonts.dart';

class ChangePasswordBottomSheet extends StatelessWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 40,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
              "Create New Password",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.outfit,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Enter your new password below",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.grey,
                fontFamily: AppFonts.outfit,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "New Password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.outfit,
              ),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: newPasswordController,
              leadingIcon: Icons.lock_outline,
              hintText: "Enter new password",
              isPassword: true,
            ),

            const SizedBox(height: 20),

            const Text(
              "Confirm Password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.outfit,
              ),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: confirmPasswordController,
              leadingIcon: Icons.lock_outline,
              hintText: "Re-enter new password",
              isPassword: true,
            ),

            const SizedBox(height: 30),

            Center(
              child: RoundedButton(
                text: "Change Password",
                verticalPadding: 15,
                horizontalPadding: 100,
                onPressed: () {
                  Navigator.pop(context); // Close after password change
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
