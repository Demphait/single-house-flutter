import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:single_house/api/api_core.dart';
import 'package:single_house/app/router/index.dart';
import 'package:single_house/network/auth_network.dart';
import 'package:single_house/views/chats/chats_view.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.init);

  Future<void> submit(
    String loginController,
    String passController,
    String emailController,
    String cofirmPasswordController,
    String inviteController,
  ) async {
    emit(RegisterState.loading);

    final bites = utf8.encode(passController);
    final digest = sha256.convert(bites);

    final resp = await AuthNetwork.register(
      login: loginController,
      password: digest.toString(),
      email: emailController,
      invite: inviteController,
    );
    if (resp.success) {
      ApiCore.setTokens(resp.data!.token, null);
      RouterCore.push(ChatsView.name);
      return;
    }
    print(resp);
    emit(RegisterState.init);
  }
}
