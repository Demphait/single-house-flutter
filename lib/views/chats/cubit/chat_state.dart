part of 'chat_cubit.dart';

// enum States {loadedChats, emptyChats, loadingChats}
//enum StatesFolders {loadedFolders, emptyFolders, loadingFolders}

class ChatState {
  // final States states;
  //final StatesFolders statesFolders;
  final List<ChatModel>? chats;
  final List<FolderModel>? folders;
  ChatState({
    //this.statesFolders = StatesFolders.loadingFolders,
    // this.states = States.loadingChats,
    //this.chats = const [],
    this.chats,
    this.folders,
  });

  ChatState copyWith ({
    // States? states,
    //StatesFolders? statesFolders,
    List<ChatModel>? chats, 
    List<FolderModel>? folders,
  }) {
    return ChatState(
      // states: states ?? this.states,
      //statesFolders: statesFolders ?? this.statesFolders,
      chats: chats ?? this.chats,
      folders: folders ?? this.folders
    );
  }
}

