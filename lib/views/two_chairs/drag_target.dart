import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/views/two_chairs/dragger.dart';

class DragTargetWidget extends StatefulWidget {
  const DragTargetWidget({
    Key? key,
    required this.listAdd,
    required this.listDel,
  }) : super(key: key);
  final List<Dragger> listAdd;
  final List<Dragger> listDel;

  @override
  State<DragTargetWidget> createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget> {
  Widget container = Container(
    child: const Center(
      child: Text(
        'Drag here',
        style: TextStyle(color: Colors.black),
      ),
    ),
    color: AppColors.white,
    height: 100,
    width: 100,
  );

  @override
  Widget build(BuildContext context) {
    return DragTarget<Color>(
      builder: (context, candidateData, rejectedData) {
        return container;
      },
      onWillAccept: (data) => true,
      // onAccept: (data) => setState(() {
      //container = data;
      // Draggable<Widget>(
      //   child: data,
      //   feedback: data,
      //   childWhenDragging: SizedBox(),
      // );
      // }),
      onAccept: (data) {
        // Widget newContainer = Draggable<Widget>(
        //   child: Container(
        //     width: 100,
        //     height: 100,
        //     color: data,
        //   ),
        //   feedback: Container(
        //     width: 100,
        //     height: 100,
        //     color: data,
        //   ),
        //   childWhenDragging: const SizedBox(),
        // );
        widget.listAdd.add(Dragger(color: data));
        widget.listDel.remove(Dragger(color: data));
        // setState(() {
        //   container = newContainer;
        // });
      },
    );
  }
}
