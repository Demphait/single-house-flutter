import 'package:single_house/utils/validation/validate.dart';

class ValidatePassword extends Validate {
  ValidatePassword({required bool isRequired}) : super(isRequired: isRequired);

  final RegExp regExp = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])');

  @override
  String? validation(String? value) {
    String? preValid = super.isNull(value);

    if (preValid == null || preValid.isNotEmpty) {
      return preValid;
    }
    value = value!;

    if (value.length < 6) {
      return 'Enter min 6 characters';
    }

    if (!regExp.hasMatch(value)) {
      return 'Enter password including 1 letter and 1 number';
    }

    return null;
  }
}
