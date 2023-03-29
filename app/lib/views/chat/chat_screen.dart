import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';
import 'dart:math';

import 'package:medibuddy/views/chat/chat_message.dart';
import 'package:medibuddy/views/chat/typing_field.dart';
import 'package:medibuddy/views/home/searchbar.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  ChatScreen({required this.name});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color3,
      body: SafeArea(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 10),
              height: size.height * 0.05,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    name,
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ChatMessage(
                        message: ' Hi',
                        receiver: true,
                      ),
                      ChatMessage(
                        message: 'HAT',
                        receiver: false,
                      ),
                      ChatMessage(
                        message: ' What',
                        receiver: true,
                      ),
                      ChatMessage(
                        message: ' Chal bey',
                        receiver: false,
                      ),
                      ChatMessage(
                        message: ' Why',
                        receiver: true,
                      ),
                      ChatMessage(
                        message: ' Get Lost',
                        receiver: false,
                      ),
                      ChatMessage(
                        message: 'Crying Silently',
                        receiver: true,
                      ),
                      ChatMessage(
                        message: 'Ab ki baar Gautam Sarkar',
                        receiver: false,
                      ),
                      ChatMessage(
                        message: ' Nhi Kejriwal',
                        receiver: true,
                      ),
                      ChatMessage(
                        message: 'HAT',
                        receiver: false,
                      ),
                      ChatMessage(
                        message: ' What',
                        receiver: true,
                      ),
                      ChatMessage(
                        message: ' I will kick your aSS',
                        receiver: false,
                      ),
                      ChatMessage(
                        message: ' I know Devansh',
                        receiver: true,
                      ),
                      ChatMessage(
                        message: ' Lord Devansh',
                        receiver: false,
                      ),
                      ChatMessage(
                        message: 'He is your fan',
                        receiver: true,
                      ),
                      ChatMessage(
                        message: 'Good Boy',
                        receiver: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TypingField(size: size)
          ],
        ),
      ),
    );
  }
}

