import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthFooter extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonTap;
  final String bottomText;
  final String bottomActionText;
  final VoidCallback onBottomTap;

  const AuthFooter({
    super.key,
    required this.buttonText,
    required this.onButtonTap,
    required this.bottomText,
    required this.bottomActionText,
    required this.onBottomTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onButtonTap,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: const Color(0xffEAAB21),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xff303B54),
            ),
          ),
        ),
        const SizedBox(height: 20),

        Row(
          children: [
            const Expanded(child: Divider(color: Colors.grey)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "or continue with",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54),
              ),
            ),
            const Expanded(child: Divider(color: Colors.grey ,indent: 4,)
            ),
          ],
        ),

        const SizedBox(height: 15),

        // Social buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/Social/facebook.png"),
              iconSize: 40,
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/Social/google.png"),
              iconSize: 40,
            ),
          ],
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bottomText,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54),
            ),
            TextButton(
              onPressed: onBottomTap,
              child: Text(
                bottomActionText,
                style: GoogleFonts.poppins(
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
