import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/views/dialog/widgets/chat_input_field.dart';
import 'package:single_house/views/dialog/widgets/demo_dialog.dart';
import 'package:single_house/views/dialog/widgets/dialog_app_bar.dart';
import 'package:single_house/views/dialog/widgets/message.dart';
import 'package:single_house/views/dialog/widgets/scroll_down_widget.dart';

class DialogView extends StatefulWidget {
  const DialogView({Key? key}) : super(key: key);
  static const String name = 'DialogView';
  static PageRoute route() => RouterCore.createRoute(
        const DialogView._(),
      );

  const DialogView._();

  @override
  State<DialogView> createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> {
  late final List<DialogModel> _demoChat;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _demoChat = demoChat2;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ScrollDownWidget(scrollController: _scrollController),
      // backgroundColor: Colors.grey,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DialogAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: AppSpace.sm),
              itemCount: _demoChat.length,
              itemBuilder: (context, index) => Message(message: _demoChat[index]),
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}
