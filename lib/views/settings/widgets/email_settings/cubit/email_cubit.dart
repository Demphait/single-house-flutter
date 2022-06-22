import 'package:bloc/bloc.dart';
import 'package:single_house/network/settings_network.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailState.init);

  Future<bool> submit(String email) async {
    emit(EmailState.loading);
    final resp = await SettingsNetwork.changeEmail(
      email: email,
    );
    if (resp.success) {
      emit(EmailState.init);
      return true;
    }
    emit(EmailState.init);
    return false;
  }
}
