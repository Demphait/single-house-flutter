import 'package:flutter/cupertino.dart';

class Dragger extends StatefulWidget {
  const Dragger({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  State<Dragger> createState() => _DraggerState();
}

class _DraggerState extends State<Dragger> {
  @override
  Widget build(BuildContext context) {
    return Draggable<Color>(
      // data: Container(
      //   height: 100,
      //   width: 100,
      //   color: widget.color,
      // ),
      data: widget.color,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: 100,
          width: 100,
          color: widget.color,
        ),
      ),
      feedback: Container(
        height: 100,
        width: 100,
        color: widget.color,
      ),
      childWhenDragging: const SizedBox(),
    );
  }
}
