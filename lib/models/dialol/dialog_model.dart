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
