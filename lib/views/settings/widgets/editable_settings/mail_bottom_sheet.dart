import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_house/utils/validation/validate_email.dart';
import 'package:single_house/views/settings/widgets/editable_settings/cubit/settings_cubit.dart';
import 'package:single_house/views/settings/widgets/settings_modal.dart';
import 'package:single_house/widgets/app_loader.dart';
import 'package:single_house/widgets/app_textfield.dart';

class EmailBottomSheet extends StatelessWidget {
  EmailBottomSheet({
    Key? key,
    required TextEditingController mailController,
  })  : _mailController = mailController,
        super(key: key);

  final TextEditingController _mailController;
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
            title: 'Email',
            onTap: () async {
              var result = await _cubit.submitEmail(_mailController.text);
              if (result) {
                return true;
              }
              return false;
            },
            child: AppTextField(
              name: 'Type new mail'.toUpperCase(),
              icon: 'assets/icons/mail_new.svg',
              controller: _mailController,
              validator: ValidateEmail(isRequired: true).validation,
            ),
          ),
        ],
      ),
    );
  }
}
