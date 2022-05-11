import 'package:single_house/utils/validation/validate.dart';

class ValidatePassword extends Validate {
  ValidatePassword({required bool isRequired}) : super(isRequired: isRequired);

  @override
  String? validation(String? value) {
    RegExp regExp = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])$');

    if ((value == null || value.isEmpty) && isRequired) {
      return 'Required field';
    }

    if (value == null) {
      return null;
    }

    if (value.length < 6) {
      return 'Enter min 6 characters';
    }

    if (!regExp.hasMatch(value)) {
      return 'Enter password including 1 letter and 1 number';
    }
    return null;
  }
}
