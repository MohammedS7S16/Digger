import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthFooter extends StatelessWidget {

  final String bottomText;
  final String bottomActionText;
  final VoidCallback onBottomTap;

  const AuthFooter({
    super.key,

    required this.bottomText,
    required this.bottomActionText,
    required this.onBottomTap,
  });

 @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: 13),
        Text(
          'Just take a look',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Color(0xffE3A325),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              child: Divider(color: Colors.grey, thickness: 1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "or continue with",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(
              width: 60,
              child: Divider(color: Colors.grey, thickness: 1),
            ),
          ],
        ),


        const SizedBox(height:0),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                    "assets/Social/facebook.png",
                    height: 55,
                    width: 55,
                    fit: BoxFit.cover,
                  ),
            ),

            Image.asset(
              "assets/Social/google.png",
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
          ],
        ),

        const SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bottomText,
              style:
              GoogleFonts.poppins(fontSize: 12, color: Colors.black54),
            ),
            TextButton(
              onPressed: onBottomTap,
              child: Text(
                bottomActionText,
                style: GoogleFonts.poppins(
                  decoration: TextDecoration.underline,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff303B54),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
