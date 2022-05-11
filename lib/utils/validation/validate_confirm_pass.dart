import 'package:flutter/cupertino.dart';
import 'package:single_house/utils/validation/validate.dart';

class ValidateConfirmPass extends Validate {
  ValidateConfirmPass({
    required bool isRequired,
    required this.passwordController,
  }) : super(isRequired: isRequired);
  final TextEditingController passwordController;

  @override
  String? validation(String? value) {
    if (value == null || (value.isEmpty) && isRequired) {
      if (isRequired == true) {
        print('Required field');
        return 'Required field';
      }
      print('null isRequired');
      return null;
    }

    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    print('null pass');
    return null;
  }
}
