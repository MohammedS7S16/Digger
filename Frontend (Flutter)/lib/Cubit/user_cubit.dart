import 'package:digger/Cubit/user_state.dart';
import 'package:digger/core/api/api_consumer.dart';
import 'package:digger/core/api/end_points.dart';
import 'package:digger/core/api/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/api/errors/error_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
  GlobalKey<FormState> signInFormKey = GlobalKey();

  TextEditingController signInEmail = TextEditingController();

  TextEditingController signInPassword = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey();

  TextEditingController signUpName = TextEditingController();

  TextEditingController signUpEmail = TextEditingController();

  TextEditingController signUpPassword = TextEditingController();

  SignIn() async {
    try {
      emit(SignInLoading());

      Response response = await api.post(
        EndPoint.signIn,
        isFromData: true,
        data: {
          ApiKey.Email: signInEmail.text,
          ApiKey.Password: signInPassword.text,
        },
      );

      if (response.statusCode == 200) {
        emit(SignInSuccess());
      } else {
        emit(
          SignInFailure(
            errMessage: "Unexpected status: ${response.statusCode}",
          ),
        );
      }
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage:  e.errModel.description ));
    } catch (e) {
      emit(SignInFailure(errMessage: e.toString()));
    }
  }
  SignUp() async {
    try {
      emit(SignUpLoading());

      Response response = await api.post(
        EndPoint.signUp,
        isFromData: true,
        data: {
          ApiKey.Email: signUpEmail.text,
          ApiKey.Password: signUpPassword.text,
          ApiKey.Username: signUpName.text,
        },
      );

      if (response.statusCode == 200) {

        emit(SignUpSuccess());
      } else {
        emit(SignUpFailure(
          errMessage: "Unexpected status: ${response.statusCode}",
        ));
      }
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.description ?? "Server error"));
    } catch (e) {
      emit(SignUpFailure(errMessage: e.toString()));
    }
  }

}


