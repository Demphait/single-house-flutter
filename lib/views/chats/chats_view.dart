import 'package:flutter/material.dart';
import 'package:single_house/app/router/router_core.dart';
import 'package:single_house/styles/app_colors.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/views/chats/cubit/chat_cubit.dart';
import 'package:single_house/widgets/app_loader.dart';
import 'package:single_house/widgets/folder_widget.dart';
import 'package:single_house/widgets/dialog_item.dart';
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
  final ChatCubit _cubit = ChatCubit();
  bool isPlaying = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late AnimationController _animationMenu;
  late AnimationController _animationBackgroundIcon;
  final ScrollController _startController = ScrollController(initialScrollOffset: 99 - 48);

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
    return BlocProvider(
      create: (context) => _cubit
        ..loadingChats()
        ..loadingFolders(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                controller: _startController,
                slivers: [
                  SliverAppBar(
                    //expandedHeight: 115,
                    title: SearchWidget(focusNode: _focusNode, controller: _controller),
                    backgroundColor: AppColors.background,
                    automaticallyImplyLeading: false,
                    floating: false,
                    pinned: false,
                    snap: false,
                  ),
                  SliverAppBar(
                    elevation: 0,
                    leadingWidth: 0,
                    backgroundColor: AppColors.background,
                    automaticallyImplyLeading: false,
                    floating: false,
                    pinned: true,
                    snap: false,
                    flexibleSpace: BlocBuilder<ChatCubit, ChatState>(
                      builder: (context, state) {
                        if (state.folders == null) {
                          return AppLoader();
                        }
                        if (state.folders!.isEmpty) {
                          return const Text('Folders not found');
                        }
                        return SizedBox(
                          height: 35 + 16,
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: AppSpace.smd, vertical: AppSpace.sm),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.folders!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return FolderWidget(
                                  folder: state.folders![index], isLast: index == state.folders!.length - 1);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BlocBuilder<ChatCubit, ChatState>(
                      builder: (context, state) {
                        if (state.chats == null) {
                          return AppLoader();
                        }
                        if (state.chats!.isEmpty) {
                          return const Text('Chats not found');
                        }
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.chats!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return DialogWidget(
                              chat: state.chats![index],
                            );
                          },
                        );
                      },
                    ),
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
                          _cubit.loadingFolders();
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
