import 'package:single_house/models/dialol/dialog_model.dart';

class VoiceMessageModel extends DialogModel {
  final String filename;
  VoiceMessageModel({
    required String time,
    required MessageStatus messageStatus,
    required bool isSender,
    required this.filename,
  }) : super(
          time: time,
          messageStatus: messageStatus,
          isSender: isSender,
        );
}
