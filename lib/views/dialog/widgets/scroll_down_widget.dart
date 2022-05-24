import 'dart:async';

import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';

class ScrollDownWidget extends StatefulWidget {
  const ScrollDownWidget({
    Key? key,
    required this.scrollController,
    required this.focusNode,
  }) : super(key: key);
  final ScrollController scrollController;
  final FocusNode focusNode;

  @override
  State<ScrollDownWidget> createState() => _ScrollDownWidgetState();
}

class _ScrollDownWidgetState extends State<ScrollDownWidget> {
  bool _isMaxPosition = false;
  _scrollListener() {
    // double _scrollPosition;
    if (widget.scrollController.hasClients) {
      // _scrollPosition = widget.scrollController.position.pixels;
      // print('$_scrollPosition');
      if (!_isMaxPosition && widget.scrollController.offset < widget.scrollController.position.maxScrollExtent * 0.90) {
        setState(() {
          print('true');
          _isMaxPosition = true;
        });
      }
      if (_isMaxPosition && widget.scrollController.offset >= widget.scrollController.position.maxScrollExtent) {
        setState(() {
          print('end');
          _isMaxPosition = false;
        });
      }
    } //TODO БАГ КОГДА ОТКРЫВАЕШЬ КЛАВИАТУРУ А ПОТОМ ТАПАЕШЬ ПО СКАФОЛДУ КНОПКА ОСТАТЕСЯ НА МАКСИМАЛЬНОЙ СКРОЛЛЕ
  }

  moveUp() {
    widget.scrollController.animateTo(widget.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
    // widget.scrollController.jumpTo(widget.scrollController.position.maxScrollExtent);
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => _scrollToBottom());
    widget.scrollController.addListener(_scrollListener);
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        setState(() {
          _isMaxPosition = true;
        });
      }
    });
    super.initState();
  }

  void _scrollToBottom() {
    if (widget.scrollController.hasClients) {
      widget.scrollController.jumpTo(widget.scrollController.position.maxScrollExtent);
      // duration: const Duration(milliseconds: 300), curve: Curves.elasticOut);
    } else {
      Timer(const Duration(milliseconds: 400), () => _scrollToBottom());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isMaxPosition,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 64),
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.keyboard_arrow_down, size: 36),
          onPressed: moveUp,
        ),
      ),
    );
  }
}



    // Future.delayed(const Duration(milliseconds: 500)).then((value) {
    //   widget.scrollController.animateTo(
    //     widget.scrollController.position.maxScrollExtent,
    //     duration: const Duration(milliseconds: 200),
    //     curve: Curves.fastOutSlowIn,
    //   );
    // });