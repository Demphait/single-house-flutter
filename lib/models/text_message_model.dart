import 'package:single_house/models/dialog_model.dart';

class TextMessageModel extends DialogModel {
  final String text;
  TextMessageModel({
    required String time,
    required MessageStatus messageStatus,
    required bool isSender,
    required this.text,
  }) : super(
          time: time,
          messageStatus: messageStatus,
          isSender: isSender,
        );
}
