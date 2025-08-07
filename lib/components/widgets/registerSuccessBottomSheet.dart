import 'package:flutter/material.dart';
import 'package:notoan/utils/constants/colors.dart';
import 'package:notoan/utils/constants/fonts.dart';

class RegisterSuccessBottomSheet extends StatelessWidget {
  const RegisterSuccessBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
        bottom: MediaQuery.of(context).viewInsets.bottom + 40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(bottom: 25),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const Icon(
            Icons.check_circle_outline,
            size: 60,
            color: AppColors.primaryGreen,
          ),
          const SizedBox(height: 20),
          const Text(
            "Register Success",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.outfit,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Congratulations! Your account has been created.\nPlease login to get an amazing experience.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.grey,
              fontFamily: AppFonts.outfit,
            ),
          ),
        ],
      ),
    );
  }
}
