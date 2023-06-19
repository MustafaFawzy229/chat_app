import 'package:flutter/material.dart';
import 'package:scholar_chat/models/message_model.dart';

import '../constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          top: 26,
          bottom: 26,
          right: 22,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
            bottomRight: Radius.circular(26),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({Key? key, required this.message})
      : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          top: 26,
          bottom: 26,
          right: 22,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
            bottomLeft: Radius.circular(26),
          ),
          color: Color(0xff006D84),
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
