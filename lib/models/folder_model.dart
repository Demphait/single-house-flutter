import 'dart:convert';

class FolderModel {
  String name;
  FolderModel({
    required this.name,
  });

  FolderModel copyWith({
    String? name,
  }) {
    return FolderModel(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory FolderModel.fromMap(Map<String, dynamic> map) {
    return FolderModel(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FolderModel.fromJson(String source) => FolderModel.fromMap(json.decode(source));

  @override
  String toString() => 'FolderModel(name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FolderModel &&
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
