import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/models/seller.dart';
import 'package:medibuddy/provider/user-provider.dart';
import 'package:medibuddy/views/chat/chat_message.dart';
import 'package:medibuddy/views/chat/typing_field.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat-screen';
  ChatScreen({required this.chatRoomId});

  // final Seller seller;
  final String chatRoomId;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = new TextEditingController();
  Stream<DocumentSnapshot>? chatStream;

  @override
  void initState() {
    super.initState();

    chatStream = FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatRoomId)
        .snapshots();
  }

  void sendMessage() {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sender": user.type == 'client' ? 'client' : 'seller',
        "time": DateTime.now().millisecondsSinceEpoch
      };

      FirebaseFirestore.instance
          .collection('chats')
          .doc(widget.chatRoomId)
          .update({
        'chat': FieldValue.arrayUnion([messageMap]),
      });

      //setState(() {
      messageController.text = "";
      //});
    }
  }

  Widget ChatMessageList() {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    print(user.type);
    return StreamBuilder(
      stream: chatStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          List<dynamic> chatList = snapshot.data!['chat'];
          chatList = List.from(chatList.reversed);
          // return Column(children: [
          //   for(int index=0;index<chatList.length;index++)
          //     ChatMessage(
          //       message: chatList[index]['message'],
          //       receiver: chatList[index]['sender'] == 'seller' ? false : true,
          //     )
          // ],);
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              reverse: true,
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> chatMessage = chatList[index];
                return ChatMessage(
                  message: chatMessage['message'],
                  receiver: chatMessage['sender'] == 'seller' ? false : true,
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color3,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: color1,
                          width: 2,
                        ),
                      )),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        "Seller name",
                        style: const TextStyle(
                          color: color1,
                          fontSize: 20,
                          fontFamily: 'GilroyLight',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                ChatMessageList(),
                SizedBox(
                  height: size.height * 0.1,
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              child: TypingField(
                size: size,
                controller: messageController,
                onSubmitted: sendMessage,
              ),
            )
          ],
        ),
      ),
    );
  }
}
