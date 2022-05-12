import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.init);

  Future<void> loading() async {
    emit(LoginState.loading);
    await Future.delayed(const Duration(seconds: 2));
      return emit(LoginState.init);
  }

  void submit(TextEditingController loginController, TextEditingController passwordController) {

  }
}
