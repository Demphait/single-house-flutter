enum ChatMessageType { text, audio, image, file }
enum MessageStatus { notSent, notView, viewed } //waiting?

class DialogModel {
  final String text;
  final String fileName;
  final String sourceFile;
  final double sizeFile;
  final String time; // !
  final ChatMessageType messageType;
  final MessageStatus messageStatus; // !
  final bool isSender; // !

  DialogModel({
    required this.text,
    required this.fileName,
    required this.sourceFile,
    required this.sizeFile,
    required this.time,
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}

List demoChat = [
  DialogModel(
    text: 'Hello master',
    fileName: '',
    sourceFile: '',
    sizeFile: 0,
    time: '11:40',
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.notSent,
    isSender: false,
  ),
  DialogModel(
    text: 'Hey my slave guy',
    fileName: '',
    sourceFile: '',
    sizeFile: 0,
    time: '11:41',
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  DialogModel(
    text: '',
    fileName: '',
    sourceFile: '',
    sizeFile: 0,
    time: '11:42',
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  DialogModel(
    text: '',
    fileName: '',
    sourceFile: '',
    sizeFile: 0,
    time: '11:43',
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  DialogModel(
    text: 'Check out this',
    fileName: '',
    sourceFile: '',
    sizeFile: 0,
    time: '11:44',
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.notView,
    isSender: true,
  ),
  DialogModel(
    text: '',
    fileName: 'dick_pick.png',
    sourceFile: 'assets/images/image.png',
    sizeFile: 2.8,
    time: '11:45',
    messageType: ChatMessageType.image,
    messageStatus: MessageStatus.notView,
    isSender: true,
  ),
  DialogModel(
    text: '',
    fileName: 'bill.txt',
    sourceFile: '',
    sizeFile: 0.8,
    time: '11:46',
    messageType: ChatMessageType.file,
    messageStatus: MessageStatus.notView,
    isSender: false,
  ),
];

// abstract class DialogModel {
//   final String time;
//   final MessageStatus messageStatus;
//   final ChatMessageType messageType;
//   final bool isSender;
//   DialogModel({
//     required this.time,
//     required this.messageStatus,
//     required this.messageType,
//     required this.isSender,
//   });
// }

// class TextMessageModel extends DialogModel {
//   final String text;
//   TextMessageModel({
//     required String time, // ПРАВИЛЬНО ЛИ???
//     required MessageStatus messageStatus,
//     required ChatMessageType messageType,
//     required bool isSender,
//     required this.text,
//   }) : super(
//           time: time,
//           messageStatus: messageStatus,
//           messageType: messageType,
//           isSender: isSender,
//         );
// }

// class VoiceMessageModel extends DialogModel {
//   VoiceMessageModel({
//     required String time,
//     required MessageStatus messageStatus,
//     required ChatMessageType messageType,
//     required bool isSender,
//   }) : super(
//           time: time,
//           messageStatus: messageStatus,
//           messageType: messageType,
//           isSender: isSender,
//         );
// }

// class ImageMessageModel extends DialogModel {
//   final String fileName;
//   final String sourceFile;
//   final double sizeFile;
//   ImageMessageModel({
//     required String time,
//     required MessageStatus messageStatus,
//     required ChatMessageType messageType,
//     required bool isSender,
//     required this.fileName,
//     required this.sourceFile,
//     required this.sizeFile,
//   }) : super(
//           time: time,
//           messageStatus: messageStatus,
//           messageType: messageType,
//           isSender: isSender,
//         );
// }

// class FileMessageModel extends DialogModel {
//   final String fileName;
//   final double sizeFile;
//   FileMessageModel({
//     required String time,
//     required MessageStatus messageStatus,
//     required ChatMessageType messageType,
//     required bool isSender,
//     required this.fileName,
//     required this.sizeFile,
//   }) : super(
//           time: time,
//           messageStatus: messageStatus,
//           messageType: messageType,
//           isSender: isSender,
//         );
// }

// List demoChat = [
//   TextMessageModel(
//     text: 'Hello master',
//     // fileName: '',
//     // sourceFile: '',
//     // sizeFile: 0,
//     time: '11:40',
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.notSent,
//     isSender: false,
//   ),
//   TextMessageModel(
//     text: 'Hey my slave guy',
//     // fileName: '',
//     // sourceFile: '',
//     // sizeFile: 0,
//     time: '11:41',
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.viewed,
//     isSender: true,
//   ),
//   VoiceMessageModel(
//     // text: '',
//     // fileName: '',
//     // sourceFile: '',
//     // sizeFile: 0,
//     time: '11:42',
//     messageType: ChatMessageType.audio,
//     messageStatus: MessageStatus.viewed,
//     isSender: false,
//   ),
//   VoiceMessageModel(
//     // text: '',
//     // fileName: '',
//     // sourceFile: '',
//     // sizeFile: 0,
//     time: '11:43',
//     messageType: ChatMessageType.audio,
//     messageStatus: MessageStatus.viewed,
//     isSender: true,
//   ),
//   TextMessageModel(
//     text: 'Check out this',
//     // fileName: '',
//     // sourceFile: '',
//     // sizeFile: 0,
//     time: '11:44',
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.notView,
//     isSender: true,
//   ),
//   ImageMessageModel(
//     // text: '',
//     fileName: 'dick_pick.png',
//     sourceFile: 'assets/images/image.png',
//     sizeFile: 2.8,
//     time: '11:45',
//     messageType: ChatMessageType.image,
//     messageStatus: MessageStatus.notView,
//     isSender: true,
//   ),
//   FileMessageModel(
//     // text: '',
//     fileName: 'bill.txt',
//     // sourceFile: '',
//     sizeFile: 0.8,
//     time: '11:46',
//     messageType: ChatMessageType.file,
//     messageStatus: MessageStatus.notView,
//     isSender: false,
//   ),
// ];
