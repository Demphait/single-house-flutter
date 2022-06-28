import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_house/utils/validation/validate_login.dart';
import 'package:single_house/views/settings/widgets/editable_settings/cubit/settings_cubit.dart';
import 'package:single_house/views/settings/widgets/settings_modal.dart';
import 'package:single_house/widgets/app_loader.dart';
import 'package:single_house/widgets/app_textfield.dart';

class LoginBottomSheet extends StatelessWidget {
  LoginBottomSheet({
    Key? key,
    required TextEditingController loginController,
  })  : _loginController = loginController,
        super(key: key);
  final TextEditingController _loginController;

  final SettingsCubit _cubit = SettingsCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Stack(
        children: [
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              switch (state) {
                case SettingsState.init:
                  return const SizedBox(height: 0);
                case SettingsState.loading:
                  return AppLoader();
              }
            },
          ),
          SettingsModal(
            title: 'Login',
            onTap: () async {
              var result = await _cubit.submitLogin(_loginController.text);
              if (result) {
                return true;
              }
              return false;
            },
            child: AppTextField(
              name: 'Type new login'.toUpperCase(),
              icon: 'assets/icons/user_new.svg',
              controller: _loginController,
              validator: ValidateLogin(isRequired: true).validation,
            ),
          ),
        ],
      ),
    );
  }
}
