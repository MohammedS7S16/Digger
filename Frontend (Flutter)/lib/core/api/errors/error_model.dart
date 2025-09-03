class ErrorModel {
  final String? code;
  final String description;
  final Map<String, dynamic>? errors;

  ErrorModel({this.code, required this.description, this.errors});

  factory ErrorModel.fromJson(List<dynamic> jsonData) {
    final first = jsonData.first as Map<String, dynamic>;
    return ErrorModel(
      code: first['code'] ,
      description: first['description'] ?? "Unknown error",
      errors: first['errors'] as Map<String, dynamic>?,
    );
  }

  String get displayMessage {
    if (errors != null && errors!.isNotEmpty) {
      final firstKey = errors!.keys.first;
      final firstError = (errors![firstKey] as List).first;
      return firstError;
    }
    return description;
  }
}
