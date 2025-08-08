import 'package:flutter/material.dart';
import 'package:notoan/components/widgets/custom_textField.dart';
import 'package:notoan/components/widgets/forgotPassword_bottomsheet.dart';
import 'package:notoan/components/widgets/rounded_button.dart';
import 'package:notoan/utils/constants/colors.dart';
import 'package:notoan/utils/constants/fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: LoginPage(),
      resizeToAvoidBottomInset: true,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Login Account",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: AppFonts.outfit,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 5),

              // Subtitle
              Text(
                "Please login with registered account",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: AppFonts.outfit,
                  fontWeight: FontWeight.w300,
                  color: AppColors.grey,
                ),
              ),

              const SizedBox(height: 30),

              // Email or Phone Number
              Text(
                "Email or Phone Number",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: AppFonts.outfit,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                leadingIcon: Icons.email_outlined,
                hintText: "Enter your email or phone number",
                controller: emailController,
              ),

              const SizedBox(height: 20),

              // Password
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: AppFonts.outfit,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                leadingIcon: Icons.lock_outline,
                hintText: "Enter your password",
                controller: passwordController,
                isPassword: true,
              ),

              const SizedBox(height: 6),

              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Handle password reset navigation
                  },
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        builder: (context) => const ForgotPasswordBottomSheet(),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: AppColors.primaryGreen,
                        fontFamily: AppFonts.outfit,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Login Button
              Center(
                child: RoundedButton(
                  horizontalPadding: 150,
                  verticalPadding: 20,
                  text: "Sign In",
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Or using other methods
              Center(
                child: Text(
                  "Or using other methods",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.outfit,
                    fontWeight: FontWeight.w300,
                    color: AppColors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Google Sign In
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/google.png", height: 24),
                    const SizedBox(width: 16),
                    const Text(
                      "Sign in with Google",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.outfit,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Facebook Sign In
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/facebook.png", height: 24),
                    const SizedBox(width: 16),
                    const Text(
                      "Sign in with Facebook",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.outfit,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
