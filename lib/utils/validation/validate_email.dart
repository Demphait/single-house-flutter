import 'package:single_house/utils/validation/validate.dart';

class ValidateEmail extends Validate {
  ValidateEmail({required bool isRequired}) : super(isRequired: isRequired);

  RegExp regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  String? validation(String? value) {
    String? preValid = super.isNull(value);

    if (preValid == null || preValid.isNotEmpty) {
      return preValid;
    }
    value = value!;

    if (!regExp.hasMatch(value)) {
      return 'Enter valid email: examle@examle.com';
    }
    return null;
  }
}
