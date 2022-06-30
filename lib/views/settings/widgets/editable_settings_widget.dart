import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';

class EditableSettingsArgs {
  final Widget widget;

  EditableSettingsArgs(this.widget);
}

class EditableSettingsWidget extends StatelessWidget {
  const EditableSettingsWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  final EditableSettingsArgs args;

  static const String name = 'EditableSettingsWidget';
  static PageRoute route(EditableSettingsArgs args) =>
      RouterCore.createTransparentRoute(
        EditableSettingsWidget(args: args),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0.8),
      body: Column(
        children: [
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: Navigator.of(context).pop,
              ),
            ),
          ),
          GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.direction > 0) {
                Navigator.of(context).pop();
              }
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(48),
                    topRight: Radius.circular(48),
                  ),
                  color: Theme.of(context).backgroundColor,
                ),
                child: args.widget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
