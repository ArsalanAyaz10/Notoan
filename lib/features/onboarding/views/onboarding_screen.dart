import 'package:flutter/material.dart';
import 'package:notoan/components/widgets/rounded_button.dart';
import 'package:notoan/utils/constants/colors.dart';
import 'package:notoan/utils/constants/fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnboardingPage());
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  int _activePageIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _pages = [
    const pageOne(),
    const pageTwo(),
    const pageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _activePageIndex = index;
                });
              },
              children: _pages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 12,
                  ),
                  width: _activePageIndex == index ? 8 : 5,
                  height: _activePageIndex == index ? 8 : 5,
                  decoration: BoxDecoration(
                    color:
                        _activePageIndex == index
                            ? AppColors.primaryGreen
                            : Colors.grey.shade400,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),

          // Bottom button that stays regardless of page
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                RoundedButton(
                  horizontalPadding: 120,
                  verticalPadding: 20,
                  text: "Create Account",
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
                const SizedBox(height: 20), // controls gap
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    "Already have an account? Login",
                    style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontFamily: AppFonts.outfit,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//pageview pages
class pageOne extends StatelessWidget {
  const pageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 70),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Image.asset("assets/images/onboarding.png"),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Easy Steps to Organize Your\n Project",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppFonts.outfit,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontFamily: AppFonts.outfit,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class pageTwo extends StatelessWidget {
  const pageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 70),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Image.asset("assets/images/onboarding.png"),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "The Best App For Tracking\nYour Projects",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppFonts.outfit,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontFamily: AppFonts.outfit,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class pageThree extends StatelessWidget {
  const pageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 70),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  Image.asset("assets/images/onboarding.png"),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Track Your Work Get\nResults.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppFonts.outfit,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontFamily: AppFonts.outfit,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
