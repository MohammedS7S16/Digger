import 'package:digger/Presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'Presentation/screens/Onboarding_screen.dart';
import 'Presentation/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "Onboarding": (context) => OnboardingScreen(),
        "Login":(context) => LoginScreen(),
      },
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
