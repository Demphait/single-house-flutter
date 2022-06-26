import 'package:flutter/material.dart';
import 'package:single_house/components/socket.io/socket.io.dart';
import 'package:single_house/styles/app_space.dart';
import 'package:single_house/styles/app_text_styles.dart';
import 'package:single_house/utils/sp_core.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _textEditingController = TextEditingController();
  final String _accessToken = SpCore.getAccessToken();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpace.md, vertical: 15),
      decoration:
          BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      child: Row(
        children: [
          // ImageIcon(
          //   const AssetImage('assets/images/attach_icon.png'),
          //   size: 24,
          //   color: AppColors.primary,
          // ),
          // const SizedBox(width: 5),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSpace.smd),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).backgroundColor,
                ),
                color: Theme.of(context).hintColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpace.sm),
                child: Scrollbar(
                  child: TextField(
                    controller: _textEditingController,
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    style: Theme.of(context).textTheme.headlineMedium,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      isDense: true,
                      hintText: 'Message',
                      hintStyle: AppTextStyles.primaryTextStyle.grey,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              SocketIO.send(
                'message_send',
                {
                  'from': _accessToken,
                  'to': '0000000000000000',
                  'message': _textEditingController.text,
                },
              );
              _textEditingController.clear();
            },
            icon: const Icon(Icons.send_rounded),
          ),
          // ImageIcon(
          //   const AssetImage('assets/images/mic.png'),
          //   size: 24,
          //   color: AppColors.primary,
          // ),
        ],
      ),
    );
  }
}
//  Map<String, dynamic> toMap() {
//     return {
//       'from': accessToken
//       'to': userId
//       'message': 'privet'
//     };jhg
//   }