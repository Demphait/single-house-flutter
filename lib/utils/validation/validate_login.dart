import 'package:single_house/utils/validation/validate.dart';

class ValidateLogin extends Validate {
  ValidateLogin({required bool isRequired}) : super(isRequired: isRequired);

  @override
  String? validation(String? value) {
    if (isRequired && (value == null || value.isEmpty)) {
      return 'Required field';
    }
    if (value == null) {
      return null;
    }
    if (value.length < 3 || value.length > 20) {
      return 'Enter min 3 characters or 20 characters max';
    }
    return null;
  }
}
