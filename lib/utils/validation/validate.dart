class Validate {
  final bool isRequired;
  Validate({
    required this.isRequired,
  });

  String? validation(String? value) {
    bool condition = value == null || value.isEmpty;
    if (isRequired && condition) return 'Required field';
    return condition ? null : '';
  }

  bool valid(String? value) => validation(value) == null;
}
