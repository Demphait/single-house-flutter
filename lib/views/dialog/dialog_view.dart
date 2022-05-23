import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/views/dialog/widgets/chat_input_field.dart';
import 'package:single_house/views/dialog/widgets/dialog_app_bar.dart';
import 'package:single_house/views/dialog/widgets/message.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DialogAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: AppSpace.sm),
              itemCount: demoChat.length,
              itemBuilder: (context, index) => Message(message: demoChat[index]),
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}
