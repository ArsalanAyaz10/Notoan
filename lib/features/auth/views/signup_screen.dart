import 'package:flutter/material.dart';
import 'package:notoan/components/widgets/custom_textField.dart';
import 'package:notoan/components/widgets/rounded_button.dart';
import 'package:notoan/services/api_service.dart';
import 'package:notoan/utils/constants/colors.dart';
import 'package:notoan/utils/constants/fonts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SignupPage(),
      resizeToAvoidBottomInset: true,
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
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
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: AppFonts.outfit,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Start learning by creating your account",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: AppFonts.outfit,
                  fontWeight: FontWeight.w300,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 30),

              // Username
              Text(
                "Username",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: AppFonts.outfit,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                leadingIcon: Icons.person_outline,
                hintText: "Create your username",
                controller: usernameController,
              ),
              const SizedBox(height: 20),

              // Email / Phone
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

              const SizedBox(height: 30),

              Center(
                child: RoundedButton(
                  horizontalPadding: 120,
                  verticalPadding: 20,
                  text: "Create Account",
                  onPressed: () async {
                    final username = usernameController.text.trim();
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    if (username.isEmpty || email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all fields")),
                      );
                      return;
                    }

                    try {
                      final result = await ApiService.registerUser(
                        username: username,
                        email: email,
                        password: password,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("✅ ${result['message']}")),
                      );

                      // Navigate to verify code page after success
                      Navigator.pushNamed(context, '/verifyCode');
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("❌ Error: $e")));
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Or using other methods",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.outfit,
                    fontWeight: FontWeight.w300,
                    color: AppColors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Google Sign Up
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50, // light white/grey shade
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/google.png", height: 24),
                    const SizedBox(width: 16),
                    const Text(
                      "Sign up with Google",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.outfit,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Facebook Sign Up
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50, // light white/grey shade
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/facebook.png", height: 24),
                    const SizedBox(width: 16),
                    const Text(
                      "Sign up with Facebook",
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
