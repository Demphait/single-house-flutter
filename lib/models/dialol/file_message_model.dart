import 'package:single_house/models/dialol/dialog_model.dart';

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
