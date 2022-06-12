import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';

class ToggleSetting extends StatefulWidget {
  const ToggleSetting({
    Key? key,
    required this.name,
    required this.icon,
    required this.switchValue,
    required this.function,
    // required this.switchValue,
  }) : super(key: key);
  final String name;
  final String icon;
  final bool switchValue;
  final Future<void> Function(bool switchValue) function;
  // final bool switchValue;

  @override
  State<ToggleSetting> createState() => _ToggleSettingState();
}

class _ToggleSettingState extends State<ToggleSetting> {
  // bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    bool _switchValue = widget.switchValue;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.md),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpace.smd),
            child: SvgPicture.asset(widget.icon, width: 40, height: 40),
          ),
          AppSpaceBox.smd,
          Expanded(
            child: Container(
              height: AppSpace.smd * 2 + 40,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.name,
                        style: AppTextStyles.largeTextStyle,
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) async {
                          setState(() {
                            _switchValue = value;
                          });
                          await widget.function(_switchValue);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
