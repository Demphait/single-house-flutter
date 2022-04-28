import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/widgets/folder_widget.dart';
import 'package:single_house/widgets/dialog_item.dart';
import 'package:single_house/widgets/search_widget.dart';
import 'dart:math' as math;

void toggleIcon() {}

class ChatsView extends StatefulWidget {
//const ChatsView({ Key? key }) : super(key: key);
  static const String name = 'ChatsView';
  static PageRoute route() => RouterCore.createRoute(
        const ChatsView._(),
      );

  const ChatsView._();

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> with TickerProviderStateMixin {
  bool isPlaying = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late AnimationController _animationMenu;
  late AnimationController _animationBackgroundIcon;

  void toggleIcon() => setState(() {
        isPlaying = !isPlaying;
        isPlaying ? _animationMenu.forward() : _animationMenu.reverse();
      });

  @override
  void initState() {
    // rebuild the textfield on focus changes
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
    _animationMenu = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationBackgroundIcon = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _animationMenu.dispose();
    _animationBackgroundIcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpace.smd, vertical: AppSpace.def),
                  child: SearchWidget(focusNode: _focusNode, controller: _controller),
                ),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: AppSpace.smd),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return FolderWidget(name: 'folder $index', isLast: index == 10 - 1);
                      //return FolderWidget(name: 'folder $index', isLast: index == 10 - 1 ? true:false);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSpace.smd),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return const DialogWidget();
                    },
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
                      toggleIcon();
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _animationMenu,
                        color: AppColors.colorMenu,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
