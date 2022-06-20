import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_button_styles.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/widgets/app_textfield.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpace.def,
        AppSpace.md,
        AppSpace.def,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Wrap(
        children: [
          Column(
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: AppSpace.md),
              AppTextField(
                name: 'Type new login'.toUpperCase(),
                icon: 'assets/icons/user_new.svg',
              ),
              const SizedBox(height: 34),
              ElevatedButton(
                style: AppButtonStyles.primaryButton,
                child: const Text('Save Changes'),
                onPressed: () => RouterCore.pop(context: context),
              ),
              SizedBox(height: AppSpace.def),
            ],
          ),
        ],
      ),
    );
  }
}
