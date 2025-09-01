import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingModel {
  final List<TextSpan> title;
  final String description;
  final String image;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: "assets/Onboarding/onboard.png",
    description:
    "The Perfect Solution For Metal Prices Prediction\nWith Simple Tools And Visuals.",
    title: [
      TextSpan(
        text: "Welcome To The World Of \n",
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color(0xff17223B),
        ),
      ),
      TextSpan(
        text: "Digger.",
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color(0xffF4A300),
        ),
      ),
    ],
  ),
  OnboardingModel(
    image: "assets/Onboarding/onboard.png",
    description:
    "Explore The Visuals And Predictions of Metal\nPrices By Ease.",
    title: [
      TextSpan(
        text: "For ",
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color(0xff17223B),
        ),
      ),
      TextSpan(
        text: "Those Looking ",
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color(0xffF4A300),
        ),
      ),
      TextSpan(
        text: "For\n Accuracy.",
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color(0xff17223B),
        ),
      ),
    ],
  ),
  OnboardingModel(
    image: "assets/Onboarding/onboard.png",
    description: "Dive Into The World Of Metals Now!",
    title: [
      TextSpan(

        text: "Your Journey Of ",
        style: GoogleFonts.poppins(

          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: const Color(0xff17223B),
        ),
      ),
      TextSpan(
        text: "Accuracy ",
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color(0xffF4A300),
        ),
      ),
     /* TextSpan(
        text: "And ",
        style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: const Color(0xff17223B),
        ),
      ),
      TextSpan(
        text: "Simplicity ",
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color(0xffF4A300),
        ),
      ),*/
      TextSpan(
        text: "\nBegins Here.",
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color(0xffF4A300),
        ),
      ),



    ],
  ),
];
