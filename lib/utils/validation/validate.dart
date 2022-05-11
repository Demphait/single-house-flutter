abstract class Validate {
  final bool isRequired;
  Validate({
    required this.isRequired,
  });

  String? validation(String? value);
  bool valid(String? value) => validation(value) == null;
}





