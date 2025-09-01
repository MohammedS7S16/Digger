import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/Onboarding_model .dart';

class CustomOnboardingBottom extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final PageController controller;
  final OnboardingModel model;

  const CustomOnboardingBottom({
    required this.currentPage,
    required this.totalPages,
    required this.controller,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 80,
          right: 30,
          left: 30,
          child: Image.asset(
            model.image,
            width: 717,
            height: 537,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: WaveClipperTwo(reverse: true),
            child: Container(
              height: 350,
              width: double.infinity,
              color: const Color(0xffe8e6e6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 65),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: model.title,
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff404D6C),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        model.description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Color(0xff989898),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: currentPage == totalPages - 1
                        ? Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("Login");
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 45,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              color: const Color(0xffEAAB21),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Text(
                              "Let’s Get Started",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff303B54),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("Login");
                          },
                          child: Text.rich(
                            TextSpan(
                              text: "Already have an account? ",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: const Color(0xff818080),
                              ),
                              children: [
                                TextSpan(
                                  text: "Log In",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: const Color(0xff303B54),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        if (currentPage > 0)
                          InkWell(
                            onTap: () {
                              controller.previousPage(
                                duration:
                                const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: const CircleAvatar(
                              radius: 33,
                              backgroundColor: Color(0xff303B54),
                              child: CircleAvatar(
                                backgroundColor: Color(0xffE6E6E3),
                                radius: 30,
                                child: Icon(
                                  size: 36,
                                  Icons.arrow_back_rounded,
                                  color: Color(0xff303B54),
                                ),
                              ),
                            ),
                          )
                        else
                          const SizedBox(width: 64),


                        SmoothPageIndicator(
                          controller: controller,
                          count: totalPages,
                          effect: JumpingDotEffect(
                            activeDotColor: Color(0xff17223B),
                            dotHeight: 6,
                            dotWidth: 6,
                            jumpScale: .7,
                            verticalOffset: 15,
                          ),
                        ),


                        InkWell(
                          onTap: () {
                            if (currentPage < totalPages - 1) {
                              controller.nextPage(
                                duration:
                                const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: const CircleAvatar(
                            backgroundColor: Color(0xff17223B),
                            radius: 33,
                            child: Icon(
                              size: 36,
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
