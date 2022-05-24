import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/models/dialog_model.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/views/dialog/widgets/chat_input_field.dart';
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
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        floatingActionButton: ScrollDownWidget(scrollController: _scrollController, focusNode: _focusNode),
        backgroundColor: Colors.grey,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: DialogAppBar(),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: AppSpace.sm, vertical: AppSpace.sm),
                itemCount: demoChat.length,
                itemBuilder: (context, index) => Message(message: demoChat[index]),
              ),
            ),
            ChatInputField(focusNode: _focusNode),
          ],
        ),
      ),
    );
  }
}


// WillPopScope(
    //   onWillPop: () async {
    //     var currentFocus = FocusScope.of(context);
    //     if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    //       FocusManager.instance.primaryFocus?.unfocus();
    //       currentFocus.focusedChild?.unfocus();
    //       return false;
    //     } else {
    //       return true;
    //     }
    //   },