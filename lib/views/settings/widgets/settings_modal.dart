import 'package:flutter/material.dart';
import 'package:single_house/app/global_context.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_button_styles.dart';
import 'package:single_house/styles/app_space.dart';

typedef SettingsModalCallBack = Future<bool> Function();

class SettingsModal extends StatelessWidget {
  SettingsModal({
    Key? key,
    required this.title,
    required this.child,
    this.onTap,
  }) : super(key: key);
  final String title;
  final Widget child;
  final SettingsModalCallBack? onTap;

  final formKey = GlobalKey<FormState>();
  List<Widget> _childWrapButton(BuildContext context) => [
        Form(
          key: formKey,
          child: child,
        ),
        SizedBox(height: AppSpace.def),
        ElevatedButton(
          style: AppButtonStyles.primaryButton,
          child: const Text('Save Changes'),
          onPressed: () async {
            bool resultValidation = formKey.currentState?.validate() ?? false;
            if (resultValidation) {
              bool result = await onTap!.call();
              if (result) {
                RouterCore.pop(context: context);
                GlobalContext.showSnackText('Changes saved');
                return;
              }
              // ECore.handle(code: 2, message: '');
            }
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpace.def,
        AppSpace.md,
        AppSpace.def,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: AppSpace.md),
          if (onTap != null) ..._childWrapButton(context) else child,
          SizedBox(height: AppSpace.def),
        ],
      ),
    );
  }
}
