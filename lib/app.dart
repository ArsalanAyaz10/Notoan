import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notoan/features/splash/views/splash_screen.dart';
import 'package:notoan/routes/route_generator.dart';
import 'package:notoan/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Notoan',
          theme: AppTheme.lightTheme,
          //initialRoute: AppRoutes.splash,
          onGenerateRoute: RouteGenerator.generateRoute,
          home: const SplashScreen(),
        );
      },
    );
  }
}
