import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:single_house/network/settings_network.dart';

part 'settings_password_state.dart';

class SettingsPasswordCubit extends Cubit<SettingsPasswordState> {
  SettingsPasswordCubit() : super(SettingsPasswordState.init);

  Future<bool> submit(String oldPassword, String newPassword) async {
    emit(SettingsPasswordState.loading);
    final bitesOldPassword = utf8.encode(oldPassword);
    final bitesNewPassword = utf8.encode(newPassword);
    final digestOldPassword = sha256.convert(bitesOldPassword);
    final digestNewPassword = sha256.convert(bitesNewPassword);
    final resp = await SettingsNetwork.changePassword(
      prevPassword: digestOldPassword.toString(),
      password: digestNewPassword.toString(),
    );
    if (resp.success) {
      emit(SettingsPasswordState.init);
      return true;
    }
    emit(SettingsPasswordState.init);
    return false;
  }
}
