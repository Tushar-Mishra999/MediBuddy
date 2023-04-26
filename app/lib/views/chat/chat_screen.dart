import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/provider/user-provider.dart';
import 'package:medibuddy/views/chat/chat_message.dart';
import 'package:medibuddy/views/chat/typing_field.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat-screen';
  ChatScreen({required this.chatRoomId, required this.name});

  final String name;
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
    FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatRoomId)
        .get()
        .then((docSnapshot) {
      if (!docSnapshot.exists) {
        FirebaseFirestore.instance
            .collection('chats')
            .doc(widget.chatRoomId)
            .set({'chats': []});
      }
    });

    chatStream = FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatRoomId)
        .snapshots();
  }

  void sendMessage({bool isImage = false}) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sender": user.type == 'client' ? 'client' : 'seller',
        "time": DateTime.now().millisecondsSinceEpoch,
        "isImage": isImage
      };

      FirebaseFirestore.instance
          .collection('chats')
          .doc(widget.chatRoomId)
          .update({
        'chats': FieldValue.arrayUnion([messageMap]),
      });

      messageController.text = "";
    }
  }

  Widget ChatMessageList() {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    final size = MediaQuery.of(context).size;
    print(user.type);
    return StreamBuilder(
      stream: chatStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          List<dynamic> chatList = snapshot.data!['chats'];
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
                return chatMessage['isImage']
                    ? Row(
                        mainAxisAlignment: chatMessage['sender'] == user.type
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 15),
                            width: size.width * 0.7,
                            height: size.width * 0.7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(chatMessage['message']),
                                    fit: BoxFit.fill)),
                          ),
                        ],
                      )
                    : ChatMessage(
                        message: chatMessage['message'],
                        receiver:
                            chatMessage['sender'] == user.type ? false : true,
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
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  height: size.height * 0.05,
                  decoration: const BoxDecoration(
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
                        widget.name,
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
