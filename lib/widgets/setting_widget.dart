import 'package:flutter/material.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({
    Key? key,
    required this.icon,
    required this.name,
    required this.info,
  }) : super(key: key);
  final String icon;
  final String name;
  final String info;

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpace.md),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpace.smd),
                // child: ImageIcon(
                //   AssetImage(widget.icon),
                //   size: 40,
                //   color: null,
                // ),
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
                        color: AppColors.dividingLine,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.name,
                            style: AppTextStyles.largeTextStyle,
                          ),
                          const Spacer(),
                          Text(widget.info, style: AppTextStyles.largeTextStyle.grey),
                          Container(
                            padding: EdgeInsets.zero,
                            width: 30,
                            child: Icon(
                              Icons.navigate_next_sharp,
                              size: 30,
                              color: AppColors.grey,
                            ),
                            // child: IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(
                            //     Icons.navigate_next_sharp,
                            //     color: AppColors.grey,
                            //   ),
                            //   // padding: EdgeInsets.zero,
                            //   // constraints: const BoxConstraints(),
                            // ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
