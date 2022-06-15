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
    if (widget.scrollController.hasClients) {
      if (!_isButtonVisible && widget.scrollController.offset > 100) {
        setState(() {
          _isButtonVisible = true;
        });
        return;
      }
      if (_isButtonVisible && widget.scrollController.offset < 100) {
        setState(() {
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
          child: Icon(
            Icons.keyboard_arrow_down,
            size: 36,
            color: AppColors.white,
          ),
          onPressed: moveUp,
        ),
      ),
    );
  }
}
