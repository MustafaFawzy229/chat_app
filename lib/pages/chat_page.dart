import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholar_chat/models/message_model.dart';
import 'package:scholar_chat/pages/cubits/chat_cubit/chat_cubit.dart';

import '../widgets/custom_chat_bubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  static String id = 'ChatPage';

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 65,
            ),
            Text('Chat'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messagesList =
                    BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                  reverse: true,
                  controller: scrollController,
                  itemCount: messagesList.length,
                  itemBuilder: (context, syntax) {
                    return messagesList[syntax].id == email
                        ? ChatBubble(
                            message: messagesList[syntax],
                          )
                        : ChatBubbleForFriend(
                            message: messagesList[syntax],
                          );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(message: data, email: email);
                controller.clear();
                scrollController.animateTo(0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
