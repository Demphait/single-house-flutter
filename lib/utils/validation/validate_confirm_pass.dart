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
    String? preValid = super.isNull(value);

    if (preValid == null || preValid.isNotEmpty) {
      return preValid;
    }
    value = value!;

    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }
}
