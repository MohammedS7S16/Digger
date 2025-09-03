import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Onboarding_model .dart';
import '../widgets/Custom_Onboarding.dart';

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

            (currentPage != onboardingData.length - 1)
                ? Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("Login");
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 10),
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
            )
                : Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    viewController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child:  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffD3D3D0),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xffDBDBDB), 
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xff858891),
                      size: 24,
                    ),
                  )


                ),
              ),
            ),


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
