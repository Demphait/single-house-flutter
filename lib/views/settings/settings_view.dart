import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_house/api/api_core.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/utils/sp_core.dart';
import 'package:single_house/utils/theme_provider.dart';
import 'package:single_house/views/auth/auth_view.dart';
import 'package:single_house/views/chats/chats_view.dart';
import 'package:single_house/views/settings/widgets/avatar_widget.dart';
import 'package:single_house/views/settings/widgets/setting_widget.dart';
import 'package:single_house/views/settings/widgets/switch_setting.dart';
import 'dart:math' as math;

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

class _SettingsViewState extends State<SettingsView> with TickerProviderStateMixin {
  bool _toggleFolders = SpCore.getFolderSetting();
  bool isDarkMode = SpCore.getDarkModeSetting();
  late AnimationController _animationBackgroundIcon;
  late AnimationController _animationMenu;

  @override
  void initState() {
    _animationMenu = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationBackgroundIcon = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationBackgroundIcon.dispose();
    _animationMenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: AppSpace.xlg),
                  const Center(child: AvatarWidget(name: 'Emma Watson', avatar: 'assets/images/avatar.png')),
                  const SizedBox(height: 52),
                  ToggleSetting(
                    name: 'Dark Mode',
                    icon: 'assets/icons/dark.svg',
                    switchValue: isDarkMode,
                    function: (bool switchValue) async {
                      final provider = Provider.of<ThemeProvider>(context, listen: false);
                      setState(() {
                        isDarkMode = switchValue;
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
                  SettingWidget(
                    name: 'Login',
                    icon: 'assets/icons/login.svg',
                    info: 'm.me/Ricardo_M',
                    func: () {},
                  ),
                  SettingWidget(
                    name: 'Password',
                    icon: 'assets/icons/pass.svg',
                    info: '*********',
                    func: () {},
                  ),
                  SettingWidget(
                    name: 'Email',
                    icon: 'assets/icons/email.svg',
                    info: 'example@gmail.com',
                    func: () {},
                  ),
                  SettingWidget(
                    name: 'Language',
                    icon: 'assets/icons/language.svg',
                    info: 'English',
                    func: () {},
                  ),
                  SettingWidget(
                    name: 'Logout',
                    icon: 'assets/icons/logout.svg',
                    info: '',
                    func: () {
                      ApiCore.setTokens(null, null);
                      RouterCore.push(AuthView.name);
                    },
                  ),
                  const SizedBox(height: 30),
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
            Positioned(
              bottom: 43,
              left: -45,
              child: Stack(
                children: [
                  AnimatedBuilder(
                    animation: _animationBackgroundIcon,
                    builder: (_, child) {
                      return Transform.rotate(
                        angle: _animationBackgroundIcon.value * 2 * math.pi,
                        child: child,
                      );
                    },
                    child: Image.asset('assets/images/gear.png'),
                  ),
                  Positioned.fill(
                    child: IconButton(
                      onPressed: () {
                        RouterCore.push(ChatsView.name);
                      },
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
