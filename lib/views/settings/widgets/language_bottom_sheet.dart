import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_button_styles.dart';
import 'package:single_house/styles/app_space.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({
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
                'Language',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: AppSpace.md),
              ElevatedButton(
                style: AppButtonStyles.greyButton,
                child: const Text('English'),
                onPressed: () {
                  RouterCore.pop(context: context);
                },
              ),
              ElevatedButton(
                style: AppButtonStyles.greyButton,
                child: const Text('Ukrainian'),
                onPressed: () {
                  RouterCore.pop(context: context);
                },
              ),
              // const SizedBox(height: 16),
              // ElevatedButton(
              //   style: AppButtonStyles.primaryButton,
              //   child: const Text('Save Changes'),
              //   onPressed: () => RouterCore.pop(context: context),
              // ),
              SizedBox(height: AppSpace.def),
            ],
          ),
        ],
      ),
    );
  }
}
