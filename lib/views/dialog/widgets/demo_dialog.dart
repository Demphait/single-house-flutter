import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/models/file_message_model.dart';
import 'package:single_house/models/image_message_model.dart';
import 'package:single_house/models/text_message_model.dart';
import 'package:single_house/models/voice_message_model.dart';
import 'package:single_house/utils/random.dart';

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
