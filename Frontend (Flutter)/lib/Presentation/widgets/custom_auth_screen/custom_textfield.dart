import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscure;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 70,
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF4F4F4),
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            fontSize: 15,
            color: const Color(0xff9CA1AC),
          ),
          prefixIcon: Icon(icon, color: const Color(0xff9CA1AC)),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xffb8b5b5), width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xffE3A325), width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xffE3A325), width: 1.5),
          ),

          errorStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: Color(0xffd59920),
          ),
        ),
      ),
    );
  }
}
