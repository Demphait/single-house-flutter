import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_house/utils/validation/validate_confirm_pass.dart';
import 'package:single_house/utils/validation/validate_password.dart';
import 'package:single_house/views/settings/widgets/editable_settings/cubit/settings_cubit.dart';
import 'package:single_house/views/settings/widgets/settings_modal.dart';
import 'package:single_house/widgets/app_loader.dart';
import 'package:single_house/widgets/app_passfield.dart';

class PasswordBottomSheet extends StatelessWidget {
  PasswordBottomSheet({
    Key? key,
    required TextEditingController oldPasswordController,
    required TextEditingController newPasswordController,
    required TextEditingController cofirmPasswordController,
  })  : _oldPasswordController = oldPasswordController,
        _newPasswordController = newPasswordController,
        _cofirmPasswordController = cofirmPasswordController,
        super(key: key);

  final TextEditingController _oldPasswordController;
  final TextEditingController _newPasswordController;
  final TextEditingController _cofirmPasswordController;
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
            title: 'Password',
            onTap: () async {
              var result = await _cubit.submitPassword(
                  _oldPasswordController.text, _newPasswordController.text);
              if (result) {
                return true;
              }
              return false;
            },
            child: Column(
              children: [
                AppPassField(
                  name: 'Type old password'.toUpperCase(),
                  icon: 'assets/icons/lock_new.svg',
                  controller: _oldPasswordController,
                  validator: ValidatePassword(isRequired: true).validation,
                ),
                AppPassField(
                  name: 'Type new password'.toUpperCase(),
                  icon: 'assets/icons/lock_new.svg',
                  controller: _newPasswordController,
                  validator: ValidatePassword(isRequired: true).validation,
                ),
                AppPassField(
                  name: 'Re-Type new password'.toUpperCase(),
                  icon: 'assets/icons/lock_new.svg',
                  controller: _cofirmPasswordController,
                  textInputAction: TextInputAction.done,
                  validator: ValidateConfirmPass(
                          isRequired: true,
                          passwordController: _newPasswordController)
                      .validation,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}