import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:single_house/network/settings_network.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState.init);

  Future<bool> submitLogin(String login) async {
    emit(SettingsState.loading);
    final resp = await SettingsNetwork.changeLogin(
      login: login,
    );
    if (resp.success) {
      emit(SettingsState.init);
      return true;
    }
    emit(SettingsState.init);
    return false;
  }

  Future<bool> submitEmail(String email) async {
    emit(SettingsState.loading);
    final resp = await SettingsNetwork.changeEmail(
      email: email,
    );
    if (resp.success) {
      emit(SettingsState.init);
      return true;
    }
    emit(SettingsState.init);
    return false;
  }

  Future<bool> submitPassword(String oldPassword, String newPassword) async {
    emit(SettingsState.loading);
    final bitesOldPassword = utf8.encode(oldPassword);
    final bitesNewPassword = utf8.encode(newPassword);
    final digestOldPassword = sha256.convert(bitesOldPassword);
    final digestNewPassword = sha256.convert(bitesNewPassword);
    final resp = await SettingsNetwork.changePassword(
      prevPassword: digestOldPassword.toString(),
      password: digestNewPassword.toString(),
    );
    if (resp.success) {
      emit(SettingsState.init);
      return true;
    }
    emit(SettingsState.init);
    return false;
  }
}
