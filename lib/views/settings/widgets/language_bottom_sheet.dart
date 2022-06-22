import 'package:flutter/material.dart';
import 'package:single_house/app/global_context.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_button_styles.dart';
import 'package:single_house/views/settings/widgets/settings_modal.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsModal(
      title: 'Language',
      child: Column(
        children: [
          ElevatedButton(
            style: AppButtonStyles.greyButton,
            child: const Text('English'),
            onPressed: () {
              GlobalContext.showSnackText('Language changed');
              RouterCore.pop(context: context);
            },
          ),
          ElevatedButton(
            style: AppButtonStyles.greyButton,
            child: const Text('Ukrainian'),
            onPressed: () {
              GlobalContext.showSnackText('Мова змінена');
              RouterCore.pop(context: context);
            },
          ),
        ],
      ),
    );
  }
}
