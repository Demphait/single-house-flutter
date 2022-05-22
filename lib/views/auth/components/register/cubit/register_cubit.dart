import 'package:bloc/bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.init);

  Future<void> loading() async {
    emit(RegisterState.loading);
    await Future.delayed(const Duration(seconds: 2));
    return emit(RegisterState.init);
  }

  void submit(
    String loginController,
    String passController,
    String emailController,
    String cofirmPasswordController,
    String inviteController,
  ) {}
}
