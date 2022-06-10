import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/utils/sp_core.dart';
import 'package:single_house/utils/theme_provider.dart';
import 'package:single_house/widgets/avatar_widget.dart';
import 'package:single_house/widgets/setting_widget.dart';
import 'package:single_house/widgets/switch_setting.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);
  static const String name = 'SettingsView';
  static PageRoute route() => RouterCore.createRoute(
        const SettingsView._(),
      );

  const SettingsView._();

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  // bool _background = SpCore.getDarkModeSetting();
  bool _toggleFolders = SpCore.getFolderSetting();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // backgroundColor: _background ? Colors.black : Colors.grey,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppSpace.xlg),
            const Center(child: AvatarWidget(name: 'Emma Watson', avatar: 'assets/images/avatar.png')),
            const SizedBox(height: 52),
            ToggleSetting(
              name: 'Dark Mode',
              icon: 'assets/icons/dark_mode.svg',
              switchValue: themeProvider.isDarkMode,
              function: (bool switchValue) async {
                // setState(() {
                //   _background = switchValue;
                // });
                // await SpCore.setDarkModeSetting(_background);
                final provider = Provider.of<ThemeProvider>(context, listen: false);
                setState(() {
                  provider.toggleTheme(switchValue);
                });
              },
            ),
            ToggleSetting(
              name: 'Scroll Folder',
              icon: 'assets/icons/folder.svg',
              switchValue: _toggleFolders,
              function: (bool switchValue) async {
                setState(() {
                  _toggleFolders = switchValue;
                });
                await SpCore.setFolderSetting(_toggleFolders);
              },
            ),
            const SettingWidget(name: 'Login', icon: 'assets/icons/login.svg', info: 'm.me/Ricardo_M'),
            const SettingWidget(name: 'Password', icon: 'assets/icons/pass.svg', info: '*********'),
            const SettingWidget(name: 'Email', icon: 'assets/icons/email.svg', info: 'example@gmail.com'),
            const SettingWidget(name: 'Language', icon: 'assets/icons/language.svg', info: 'English'),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: AppSpace.sm),
              child: Text(
                'Signal House - version 0.1',
                style: AppTextStyles.smallTextStyle.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
