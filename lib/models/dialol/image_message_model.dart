import 'package:single_house/models/dialol/dialog_model.dart';

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
