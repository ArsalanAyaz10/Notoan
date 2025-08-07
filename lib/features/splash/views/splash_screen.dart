import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:notoan/routes/app_routes.dart';
import 'package:notoan/utils/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notoan/utils/constants/fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Noto',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 45,
                    color: AppColors.black,
                    fontFamily: AppFonts.outfit,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'an.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.outfit,
                        fontSize: 45,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 4),
            Center(
              child: Text(
                'Project Management App',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.outfit,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                'Version 0.0.1',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.outfit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
