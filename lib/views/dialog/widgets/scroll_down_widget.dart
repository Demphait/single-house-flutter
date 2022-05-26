import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';

class ScrollDownWidget extends StatefulWidget {
  const ScrollDownWidget({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;

  @override
  State<ScrollDownWidget> createState() => _ScrollDownWidgetState();
}

class _ScrollDownWidgetState extends State<ScrollDownWidget> {
  bool _isButtonVisible = false;

  _scrollListener() {
    double _scrollPosition;
    if (widget.scrollController.hasClients) {
      _scrollPosition = widget.scrollController.position.pixels;
      print('$_scrollPosition');
      if (!_isButtonVisible && widget.scrollController.offset > 100) {
        setState(() {
          print('true');
          _isButtonVisible = true;
        });
        return;
      }
      if (_isButtonVisible && widget.scrollController.offset < 100) {
        setState(() {
          print('end');
          _isButtonVisible = false;
        });
        return;
      }
    }
  }

  moveUp() {
    widget.scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  void initState() {
    widget.scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isButtonVisible,
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
