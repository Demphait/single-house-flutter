import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_house/utils/validation/validate_email.dart';
import 'package:single_house/views/settings/widgets/email_settings/cubit/email_cubit.dart';
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
  final EmailCubit _cubit = EmailCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Stack(
        children: [
          BlocBuilder<EmailCubit, EmailState>(
            builder: (context, state) {
              switch (state) {
                case EmailState.init:
                  return const SizedBox(height: 0);
                case EmailState.loading:
                  return AppLoader();
              }
            },
          ),
          SettingsModal(
            title: 'Email',
            onTap: () async {
              var result = await _cubit.submit(_mailController.text);
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
