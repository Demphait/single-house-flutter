import 'package:single_house/utils/validation/validate.dart';

class ValidateLogin extends Validate {
  ValidateLogin({required bool isRequired}) : super(isRequired: isRequired);

  @override
  String? validation(String? value) {
    String? preValid = super.isNull(value);

    if (preValid == null || preValid.isNotEmpty) {
      return preValid;
    }
    value = value!;

    if (value.length < 3 || value.length > 20) {
      return 'Enter min 3 characters or 20 characters max';
    }
    return null;
  }
}
