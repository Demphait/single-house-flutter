class Validate {
  final bool isRequired;
  Validate({
    required this.isRequired,
  });

  String? isNull (String? value) {
    bool condition = value == null || value.isEmpty;
    if (isRequired && condition) return 'Required field'; 
    return condition ? null : '';
  }

  String? validation(String? value) {
    String result = isNull(value) ?? '';
    return result.isEmpty ? null : result;
  }

  bool valid(String? value) => validation(value) == null;
}
