import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../models/Onboarding_model .dart';
import '../widgets/Custom_Onboarding_Bottom.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController viewController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd6d4d4),
      body: SafeArea(
        child: Stack(
          children: [
            if (currentPage != onboardingData.length - 1)
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("Login");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      "Skip",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff404D6C),
                      ),
                    ),
                  ),
                ),
              ),

            // PageView
            PageView.builder(
              controller: viewController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return CustomOnboardingBottom(
                  currentPage: index,
                  totalPages: onboardingData.length,
                  controller: viewController,
                  model: onboardingData[currentPage],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
