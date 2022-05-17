part of 'chat_cubit.dart';

// enum States {loadedChats, emptyChats, loadingChats}
//enum StatesFolders {loadedFolders, emptyFolders, loadingFolders}
enum ChatStatus { ready, loading }

class ChatState {
  final ChatStatus status;
  // final States states;
  //final StatesFolders statesFolders;
  final List<ChatModel> chats;
  final List<FolderModel> folders;
  ChatState({
    //this.statesFolders = StatesFolders.loadingFolders,
    // this.states = States.loadingChats,
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
