import 'dart:async';

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
  final ScrollController _scrollController = ScrollController();
  bool _keyboardVisible = false;
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => _scrollToBottom());
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      // duration: const Duration(milliseconds: 300), curve: Curves.elasticOut);
    } else {
      Timer(const Duration(milliseconds: 400), () => _scrollToBottom());
    }
  }

  _scrollListener() {
    double _scrollPosition;
    if (_scrollController.hasClients) {
      _scrollPosition = _scrollController.position.pixels;
      print('$_scrollPosition');
      if (_keyboardVisible == false && _scrollController.offset < _scrollController.position.maxScrollExtent * 0.95) {
        setState(() {
          print('true');
          _keyboardVisible = true;
        });
      }
      if (_keyboardVisible == true && _scrollController.offset >= _scrollController.position.maxScrollExtent) {
        setState(() {
          print('end');
          _keyboardVisible = false;
        });
      }
      // if (_scrollController.offset >= MediaQuery.of(context).size.height / 2) {
      // if (MediaQuery.of(context).viewInsets.bottom != 0) {
      //   print('true');
      //   setState(() {
      //     _keyboardVisible = true;
      //   });
      // } else {
      //   print('false');
      //   _keyboardVisible = false;
      // }
      // if(_scrollController.position.atEdge) {
      // if (_scrollController.position.pixels == 0) {
      //   if (_keyboardVisible == false) {
      //     setState(() {
      //       print('true');
      //       _keyboardVisible = true;
      //     });
      //   } else {
      //     if (_keyboardVisible == true) {
      //       setState(() {
      //         print('false');
      //         _keyboardVisible = false;
      //       });
      //     }
      //   }
      // }
      // }
    }
  }

  _moveUp() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _keyboardVisible,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 64),
          child: FloatingActionButton(
            child: const Icon(Icons.expand_circle_down_outlined),
            onPressed: _moveUp,
          ),
        ),
      ),
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
          const ChatInputField(),
        ],
      ),
    );
  }
}
