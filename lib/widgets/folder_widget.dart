import 'package:flutter/material.dart';
import 'package:single_house/models/folder_model.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';

class FolderWidget extends StatefulWidget {
  const FolderWidget({
    Key? key,
    required this.folder,
    this.isLast = false,
  }) : super(key: key);

  final FolderModel folder;
  final bool isLast;

  @override
  State<FolderWidget> createState() => _FolderWidgetState();
}

class _FolderWidgetState extends State<FolderWidget> {
  bool _isActiveButton = true;

  void _changeColor() {
    setState(
      () {
        _isActiveButton = !_isActiveButton;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: widget.isLast ? 0 : AppSpace.sm),
      child: ElevatedButton(
        onPressed: _changeColor,
        child: Text(widget.folder.name, style: TextStyle(color: _isActiveButton ? AppColors.white : AppColors.black)),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            _isActiveButton
                ? AppColors.primary // true
                : AppColors.unactiveFolder, // false
          ),
        ),
      ),
    );
  }
}
