import 'package:flutter/material.dart';

class AuthAnimatedContainer extends StatelessWidget {
  final Widget child;

  const AuthAnimatedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      top: keyboardHeight > 0 ? screenHeight * 0.05 : screenHeight * 0.25,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xffE4E4E4),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
          ),
        ),
        child: child,
      ),
    );
  }
}
