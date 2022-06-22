import 'package:bloc/bloc.dart';
import 'package:single_house/network/settings_network.dart';

part 'settings_login_state.dart';

class SettingsLoginCubit extends Cubit<SettingsLoginState> {
  SettingsLoginCubit() : super(SettingsLoginState.init);

  Future<bool> submit(String login) async {
    emit(SettingsLoginState.loading);
    final resp = await SettingsNetwork.changeLogin(
      login: login,
    );
    if (resp.success) {
      emit(SettingsLoginState.init);
      return true;
    }
    emit(SettingsLoginState.init);
    return false;
  }
}
