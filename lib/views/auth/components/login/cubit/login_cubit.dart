import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:single_house/api/api_core.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/network/auth_network.dart';
import 'package:single_house/views/chats/chats_view.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.init);

  Future<void> loading() async {
    emit(LoginState.loading);
    await Future.delayed(const Duration(seconds: 2));
    return emit(LoginState.init);
  }

  Future<void> submit(String login, String password) async {
    emit(LoginState.loading);

    final bites = utf8.encode(password);
    final digest = sha256.convert(bites);

    final resp = await AuthNetwork.login(
      login: login,
      password: digest.toString(),
    );
    if (resp.success) {
      ApiCore.setTokens(resp.data!.token, null);
      RouterCore.push(ChatsView.name);
      return;
    }
    print(resp);
    emit(LoginState.init);
  }
}
