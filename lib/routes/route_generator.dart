import 'package:flutter/material.dart';
import 'package:notoan/features/auth/views/login_screen.dart';
import 'package:notoan/features/auth/views/signup_screen.dart';
import 'package:notoan/features/auth/views/verifycode_screen.dart';
import 'package:notoan/features/home/view/home_screen.dart';
import 'package:notoan/features/onboarding/views/onboarding_screen.dart';
import 'package:notoan/features/splash/views/splash_screen.dart';
import 'package:notoan/routes/app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.verifyCode:
        return MaterialPageRoute(builder: (_) => const VerifycodeScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.taskDetails:
      // return MaterialPageRoute(builder: (_) => const TaskDetailsScreen());
      case AppRoutes.profile:
      //return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case AppRoutes.settings:
      //return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
