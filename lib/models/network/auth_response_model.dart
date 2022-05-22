import 'dart:convert';

class AuthResponseModel {
  final String token;
  
  AuthResponseModel({
    required this.token,
  });

  AuthResponseModel copyWith({
    String? token,
  }) {
    return AuthResponseModel(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthResponseModel(
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromJson(String source) => AuthResponseModel.fromMap(json.decode(source));

  @override
  String toString() => 'AuthResponseModel(token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AuthResponseModel &&
      other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
