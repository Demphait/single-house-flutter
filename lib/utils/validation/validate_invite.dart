import 'package:single_house/utils/validation/validate.dart';

class ValidateInvite extends Validate {
  ValidateInvite({required bool isRequired}) : super(isRequired: isRequired);

  @override
  String? validation(String? value) {
    if ((value == null || value.isEmpty) && isRequired) {
      return 'Required field';
    }
    return null;
  }
}
