import 'package:digger/Presentation/widgets/custom_auth_screen/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import '../../Cubit/user_cubit.dart';
import '../../Cubit/user_state.dart';
import '../models/Validator.dart';
import '../widgets/custom_auth_screen/Animated_container.dart';
import '../widgets/custom_auth_screen/Toast_Helper.dart';
import '../widgets/custom_auth_screen/custom_forget_password.dart';
import '../widgets/custom_auth_screen/custom_textfield.dart';
import '../widgets/custom_auth_screen/footer_auth.dart';
import '../widgets/custom_auth_screen/hearder_auth_screen.dart';
import '../widgets/custom_auth_screen/intro_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ToastHelper.showToast(
            context: context,
            message: "Login successful ",
            type: ToastificationType.success,
          );

          Navigator.of(context).pushNamed(
            "Verification",
            arguments: context.read<UserCubit>().signInEmail.text.trim(),
          );
        } else if (state is SignInFailure) {
          ToastHelper.showToast(
            context: context,
            message: "This account does not exist",
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              HeaderAuthScreen(
                title: 'Hello!',
                subtitle: 'Welcome to Digger App',
              ),
              AuthAnimatedContainer(
                child: SingleChildScrollView(
                  child: Form(
                    key: context.read<UserCubit>().signInFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IntroText( text: 'Log In',),
                        const SizedBox(height: 20),

                        CustomTextField(
                          controller: context.read<UserCubit>().signInEmail,
                          hint: "Email",
                          icon: Icons.email_outlined,
                          validator: Validators.validateEmail,
                        ),
                        const SizedBox(height: 15),

                        CustomTextField(
                          controller: context.read<UserCubit>().signInPassword,
                          hint: "Password",
                          icon: Icons.lock_outline,
                          obscure: true,
                          validator: Validators.validatePassword,
                        ),

                        CustomForgetPassword(),
                        const SizedBox(height: 10),

                        state is SignInLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                buttonText: "LOG IN",
                                onPressed: () {
                                  if (context
                                      .read<UserCubit>()
                                      .signInFormKey
                                      .currentState!
                                      .validate()) {
                                    context.read<UserCubit>().SignIn();
                                  }
                                },
                              ),
                        const SizedBox(height: 20),

                        AuthFooter(
                          bottomText: "Don't have an account?",
                          bottomActionText: "Sign Up",
                          onBottomTap: () {
                            Navigator.of(context).pushNamed("SignUP");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
