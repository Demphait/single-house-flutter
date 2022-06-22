import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_house/utils/validation/validate_login.dart';
import 'package:single_house/views/settings/widgets/settings_modal.dart';
import 'package:single_house/widgets/app_loader.dart';
import 'package:single_house/widgets/app_textfield.dart';

import 'cubit/settings_login_cubit.dart';

class LoginBottomSheet extends StatelessWidget {
  LoginBottomSheet({
    Key? key,
    required TextEditingController loginController,
  })  : _loginController = loginController,
        super(key: key);
  final TextEditingController _loginController;

  final SettingsLoginCubit _cubit = SettingsLoginCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Stack(
        children: [
          BlocBuilder<SettingsLoginCubit, SettingsLoginState>(
            builder: (context, state) {
              switch (state) {
                case SettingsLoginState.init:
                  return const SizedBox(height: 0);
                case SettingsLoginState.loading:
                  return AppLoader();
              }
            },
          ),
          SettingsModal(
            title: 'Login',
            onTap: () async {
              var result = await _cubit.submit(_loginController.text);
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
