import 'package:single_house/utils/validation/validate.dart';

class ValidatePassword extends Validate {
  ValidatePassword({required bool isRequired}) : super(isRequired: isRequired);

  @override
  String? validation(String? value) {
    RegExp regExp = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{6,}$');

    if (value == null || (value.isEmpty) && isRequired) {
      if (isRequired == true) {
        print('Required field');
        return 'Required field';
      }
      print('null isRequired');
      return null;
    }

    // if (value.length < 6) {
    //   print('Enter min 6 characters');
    //   return 'Enter min 6 characters';
    // }
    if (!regExp.hasMatch(value)) {
      return 'Enter min 6 characters, including 1 letter and 1 number';
    }
    print('null pass');
    return null;
  }
}
