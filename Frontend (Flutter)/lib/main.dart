import 'package:digger/Presentation/screens/Sign_up_screen.dart';
import 'package:digger/Presentation/screens/splash_screen.dart';
import 'package:digger/core/api/api_consumer.dart';
import 'package:digger/core/api/dio_consumer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/user_cubit.dart';
import 'Presentation/screens/Onboarding_screen.dart';
import 'Presentation/screens/Verification_Screen.dart';
import 'Presentation/screens/login_screen.dart';

void main() {
  runApp(BlocProvider(create: (context) => UserCubit(DioConsumer(dio: Dio())), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        "Onboarding": (context) => OnboardingScreen(),
        "Login": (context) => LoginScreen(),
        "SignUP": (context) => SignUpScreen(),
        "Verification": (context) => VerificationScreen(),
      },
    );
  }
}
