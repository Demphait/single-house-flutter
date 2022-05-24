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

List<DialogModel> get demoChat => [
      TextMessageModel(
        text: 'Hello master',
        time: '11:40',
        messageStatus: MessageStatus.notSent,
        isSender: false,
      ),
      TextMessageModel(
        text: 'Hey my slave guy',
        time: '11:41',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:42',
        messageStatus: MessageStatus.viewed,
        isSender: false,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      TextMessageModel(
        text: 'Check out this',
        time: '11:44',
        messageStatus: MessageStatus.notView,
        isSender: true,
      ),
      ImageMessageModel(
        fileName: 'dick_pick.png',
        sourceFile: 'assets/images/image.png',
        sizeFile: 2.8,
        time: '11:45',
        messageStatus: MessageStatus.notView,
        isSender: true,
      ),
      FileMessageModel(
        fileName: 'bill.txt',
        sizeFile: 0.8,
        time: '11:46',
        messageStatus: MessageStatus.notView,
        isSender: false,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
      VoiceMessageModel(
        filename: '',
        time: '11:43',
        messageStatus: MessageStatus.viewed,
        isSender: true,
      ),
    ];
