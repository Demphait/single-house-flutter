import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/views/chats/cubit/chat_cubit.dart';
import 'package:single_house/widgets/app_loader.dart';
import 'package:single_house/widgets/dialog_item.dart';
import 'package:single_house/widgets/layout/folder_linear_layout.dart';
import 'package:single_house/widgets/layout/folder_wrap_layout.dart';
import 'package:single_house/widgets/search_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

void toggleIcon() {}

class ChatsView extends StatefulWidget {
  const ChatsView({Key? key}) : super(key: key);
  static const String name = 'ChatsView';
  static PageRoute route() => RouterCore.createRoute(
        const ChatsView._(),
      );

  const ChatsView._();

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _controllerChats = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final ChatCubit _cubit = ChatCubit();
  late AnimationController _animationBackgroundIcon;
  late AnimationController _animationMenu;
  bool _isExpandedSearch = false;
  bool _toggleFolders = true;
  bool isPlaying = false;

  _scrollListener() {
    if (_isExpandedSearch && _controllerChats.offset > _controllerChats.position.minScrollExtent) {
      setState(() {
        _isExpandedSearch = false;
      });
    } else if (!_isExpandedSearch && _controllerChats.offset < _controllerChats.position.minScrollExtent) {
      setState(() {
        _isExpandedSearch = true;
      });
    }
  }

  void toggleIcon() => setState(() {
        isPlaying = !isPlaying;
        isPlaying ? _animationMenu.forward() : _animationMenu.reverse();
      });

  @override
  void initState() {
    // rebuild the textfield on focus changes
    _controllerChats.addListener(_scrollListener);
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
    _animationMenu = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
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
    return BlocProvider(
      create: (context) => _cubit
        ..loadingChats()
        ..loadingFolders(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AnimatedContainer(
                    padding: EdgeInsets.all(AppSpace.smd),
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(),
                    height: _isExpandedSearch ? 40 + 24 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: SearchWidget(
                      focusNode: _focusNode,
                      controller: _controller,
                    ),
                  ),
                  BlocBuilder<ChatCubit, ChatState>(
                    builder: (context, state) {
                      if (state.folders == null) {
                        return AppLoader();
                      }
                      if (state.folders!.isEmpty) {
                        return const Text('Folders not found');
                      }
                      return _toggleFolders
                          ? FolderLinearLayout(folders: state.folders!)
                          : FolderWrapLayout(folders: state.folders!);
                    },
                  ),
                  BlocBuilder<ChatCubit, ChatState>(
                    builder: (context, state) {
                      if (state.chats == null) {
                        return AppLoader();
                      }
                      if (state.chats!.isEmpty) {
                        return const Text('Chats not found');
                      }
                      return Expanded(
                        child: ListView.builder(
                          controller: _controllerChats,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.chats!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return DialogWidget(
                              chat: state.chats![index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
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
                          _toggleFolders = !_toggleFolders;
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
        ),
      ),
    );
  }
}
