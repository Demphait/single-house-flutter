import 'package:single_house/utils/random.dart';

enum ChatMessageType { text, audio, image, file }
enum MessageStatus { notSent, notView, viewed } //waiting?

abstract class DialogModel {
  final String time;
  final MessageStatus messageStatus;
  final bool isSender;
  DialogModel({
    required this.time,
    required this.messageStatus,
    required this.isSender,
  });
}

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

class ImageMessageModel extends DialogModel {
  final String fileName;
  final String sourceFile;
  final double sizeFile;
  ImageMessageModel({
    required String time,
    required MessageStatus messageStatus,
    required bool isSender,
    required this.fileName,
    required this.sourceFile,
    required this.sizeFile,
  }) : super(
          time: time,
          messageStatus: messageStatus,
          isSender: isSender,
        );
}

class FileMessageModel extends DialogModel {
  final String fileName;
  final double sizeFile;
  FileMessageModel({
    required String time,
    required MessageStatus messageStatus,
    required bool isSender,
    required this.fileName,
    required this.sizeFile,
  }) : super(
          time: time,
          messageStatus: messageStatus,
          isSender: isSender,
        );
}

List<DialogModel> get demoChat2 => List.generate(50, (index) {
      int messageType = 4.rand;
      bool isSender = 2.rand == 1;
      MessageStatus messageStatus = MessageStatus.values[MessageStatus.values.length.rand];
      String time = '00:' + (50 - index).toString();
      switch (messageType) {
        case 0:
          return TextMessageModel(
            time: time,
            isSender: isSender,
            text: 'a' * (50.rand + 1),
            messageStatus: messageStatus,
          );
        case 1:
          return VoiceMessageModel(
            time: time,
            isSender: isSender,
            filename: 'a',
            messageStatus: messageStatus,
          );
        case 2:
          return FileMessageModel(
            time: time,
            isSender: isSender,
            fileName: 'a' * (50.rand + 1),
            sizeFile: 0.5.rand + 0.9,
            messageStatus: messageStatus,
          );
        default:
          return ImageMessageModel(
            time: time,
            isSender: isSender,
            fileName: 'a' * (50.rand + 1),
            sourceFile: 'assets/images/image.png',
            sizeFile: 0.8.rand + 0.1,
            messageStatus: messageStatus,
          );
      }
    });
