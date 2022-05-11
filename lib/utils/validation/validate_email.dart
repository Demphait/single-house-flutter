import 'package:single_house/utils/validation/validate.dart';

class ValidateEmail extends Validate {
  ValidateEmail({required bool isRequired}) : super(isRequired: isRequired);

  @override
  String? validation(String? value) {
    RegExp regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (value == null || (value.isEmpty) && isRequired) {
      if (isRequired == true) {
        print('Required field');
        return 'Required field';
      }
      print('null isRequired');
      return null;
    }

    if (!regExp.hasMatch(value)) {
      return 'Enter valid email: examle@examle.com';
    }
    print('null pass');
    return null;
  }
}
