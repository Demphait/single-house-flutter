import 'package:intl/intl.dart';
enum ChatMessageType { text, audio, image, file }
enum MessageStatus { notSent, notView, viewed } //waiting?

class ChatMessage {
  final String text;
  final String fileName;
  final String sourceFile;
  final double sizeFile; 
  final String time;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
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
  ChatMessage(
    text: 'Hello master',
    fileName: '',
    sourceFile: '',
    sizeFile: 0,
    time: '11:40',
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.notSent,
    isSender: false,
  ),
  ChatMessage(
    text: 'Hey my slave guy',
    fileName: '',
    sourceFile: '',
    sizeFile: 0,
    time: '11:41',
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: '',
    fileName: '',
    sourceFile: '',
    sizeFile: 0,
    time: '11:42',
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: '',
    fileName: '',
    sourceFile: '',
    sizeFile: 0,
    time: '11:43',
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: 'Check out this',
    fileName: '',
    sourceFile: '',
    sizeFile: 0,
    time: '11:44',
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.notView,
    isSender: true,
  ),
  ChatMessage(
    text: '',
    fileName: 'dick_pick.png',
    sourceFile: 'assets/images/image.png',
    sizeFile: 2.8,
    time: '11:45',
    messageType: ChatMessageType.image,
    messageStatus: MessageStatus.notView,
    isSender: true,
  ),
  ChatMessage(
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
