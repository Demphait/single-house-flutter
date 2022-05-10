import 'package:bloc/bloc.dart';
import 'package:single_house/models/chat_model.dart';
import 'package:single_house/models/folder_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState());

  Future<void> loadingChats() async {
    emit(ChatState(folders: state.folders));
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
    emit(state.copyWith(chats: chats));
  }

  Future<void> loadingFolders() async {
    emit(ChatState(chats: state.chats)); 
    await Future.delayed(const Duration(seconds: 2));
    List<FolderModel> folders = List.generate(
      8,
      (index) => FolderModel(name: 'Folder$index'),
    );
    emit(state.copyWith(folders: folders));
  }
}
