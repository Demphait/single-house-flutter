

class ApiResponse<T> {
  final bool success;
  final int code;
  final T data;

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
    T? data,
  }) {
    return ApiResponse(
      success: success ?? this.success,
      code: code ?? this.code,
      data: data ?? this.data,
    );
  }

  ApiResponse<T> setData<T>(T newData) {
    return ApiResponse<T>(success: success, code: code, data: newData);
  }
}
