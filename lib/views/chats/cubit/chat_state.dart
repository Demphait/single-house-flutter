part of 'chat_cubit.dart';

enum ChatStatus { ready, loading }

class ChatState {
  final ChatStatus status;
  final List<ChatModel> chats;
  final List<FolderModel> folders;
  ChatState({
    this.status = ChatStatus.loading,
    this.chats = const [],
    this.folders = const [],
  });

  ChatState copyWith({
    ChatStatus? status,
    List<ChatModel>? chats,
    List<FolderModel>? folders,
  }) {
    return ChatState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      folders: folders ?? this.folders,
    );
  }
}
