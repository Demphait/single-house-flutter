import 'dart:convert';

class ApiResponse {
  final bool success;
  final int code;
  final dynamic data;

  factory ApiResponse.success(int code, [dynamic data]) =>
      ApiResponse(success: true, code: code, data: data);

  factory ApiResponse.fail(int code, [dynamic data]) =>
      ApiResponse(success: false, code: code, data: data);

  ApiResponse({
    required this.success,
    required this.code,
    required this.data,
  });

  ApiResponse copyWith({
    bool? success,
    int? code,
    dynamic data,
  }) {
    return ApiResponse(
      success: success ?? this.success,
      code: code ?? this.code,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'code': code,
      'data': data,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      success: map['success'] ?? false,
      code: map['code']?.toInt() ?? 0,
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'ApiResponse(success: $success, code: $code, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiResponse &&
        other.success == success &&
        other.code == code &&
        other.data == data;
  }

  @override
  int get hashCode => success.hashCode ^ code.hashCode ^ data.hashCode;
}
