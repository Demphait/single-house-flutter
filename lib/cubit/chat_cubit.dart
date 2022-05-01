import 'package:bloc/bloc.dart';
import 'package:single_house/models/chat_model.dart';
import 'package:single_house/models/folder_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  Future<void> loadingChats() async {
    emit(state.copyWith(states: States.loadingChats));
    await Future.delayed(const Duration(seconds: 2));
    List<ChatModel> chats = List.generate(
        50,
        (index) => ChatModel(
              name: 'Ricardo Milos',
              dialog: 'Do you wanna play with me?',
              time: '11:47',
              counterMessage: '1',
              img: 'assets/images/avatar.png',
            ));
    if (chats.isEmpty) {
      return emit(state.copyWith(states: States.emptyChats));
    }
    emit(state.copyWith(states: States.loadedChats, chats: chats));
  }

  Future<void> loadingFolders() async {
    emit(state.copyWith(statesFolders: StatesFolders.loadingFolders));
    await Future.delayed(const Duration(seconds: 2));
    List<FolderModel> folders = List.generate(
      8,
      (index) => FolderModel(name: 'Folder$index'),
    );
    if (folders.isEmpty) {
      return emit(state.copyWith(statesFolders: StatesFolders.emptyFolders));
    }
    emit(state.copyWith(statesFolders: StatesFolders.loadedFolders, folders: folders));
  }
}
