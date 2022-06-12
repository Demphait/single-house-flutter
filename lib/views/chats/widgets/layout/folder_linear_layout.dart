import 'package:flutter/material.dart';
import 'package:single_house/models/folder_model.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/views/chats/widgets/folder_widget.dart';

class FolderLinearLayout extends StatelessWidget {
  const FolderLinearLayout({
    Key? key,
    required this.folders,
  }) : super(key: key);
  final List<FolderModel> folders;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 + 16,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: AppSpace.smd, vertical: AppSpace.sm),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: folders.length,
        itemBuilder: (BuildContext context, int index) {
          return FolderWidget(folder: folders[index], isLast: index == folders.length - 1);
        },
      ),
    );
  }
}
