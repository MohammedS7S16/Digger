import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed("forgetpassword");
        },
        child: Text(
          "Forgot Password ?",
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
