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
    String login,
    String pass,
    String email,
    String cofirmPassword,
    String invite,
  ) async {
    emit(RegisterState.loading);

    final bites = utf8.encode(pass);
    final digest = sha256.convert(bites);

    final resp = await AuthNetwork.register(
      login: login,
      password: digest.toString(),
      email: email,
      invite: invite,
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
