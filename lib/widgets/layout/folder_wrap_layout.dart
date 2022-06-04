import 'package:flutter/material.dart';
import 'package:single_house/models/folder_model.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/widgets/folder_widget.dart';

class FolderWrapLayout extends StatelessWidget {
  const FolderWrapLayout({
    Key? key,
    required this.folders,
  }) : super(key: key);
  final List<FolderModel> folders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppSpace.smd, right: AppSpace.xsm),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: List.generate(
          folders.length,
          (index) => FolderWidget(folder: folders[index]),
        ),
      ),
    );
  }
}