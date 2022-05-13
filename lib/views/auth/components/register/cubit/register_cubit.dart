import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.init);

  Future<void> loading() async {
    emit(RegisterState.loading);
    await Future.delayed(const Duration(seconds: 2));
    return emit(RegisterState.init);
  }

  void submit(
    String emailController,
    String cofirmPasswordController,
    String inviteController,
  ) {}
}
