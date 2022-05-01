import 'dart:convert';


class ChatModel {
  final String name;
  final String dialog;
  final String time;
  final String counterMessage;
  final String img;
  ChatModel({
    required this.name,
    required this.dialog,
    required this.time,
    required this.counterMessage,
    required this.img,
  });

  ChatModel copyWith({
    String? name,
    String? dialog,
    String? time,
    String? counterMessage,
    String? img,
  }) {
    return ChatModel(
      name: name ?? this.name,
      dialog: dialog ?? this.dialog,
      time: time ?? this.time,
      counterMessage: counterMessage ?? this.counterMessage,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dialog': dialog,
      'time': time,
      'counterMessage': counterMessage,
      'img': img,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      name: map['name'] ?? '',
      dialog: map['dialog'] ?? '',
      time: map['time'] ?? '',
      counterMessage: map['counterMessage'] ?? '',
      img: map['img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatModel(name: $name, dialog: $dialog, time: $time, counterMessage: $counterMessage, img: $img)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ChatModel &&
      other.name == name &&
      other.dialog == dialog &&
      other.time == time &&
      other.counterMessage == counterMessage &&
      other.img == img;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      dialog.hashCode ^
      time.hashCode ^
      counterMessage.hashCode ^
      img.hashCode;
  }
}
