import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool receiver;
  ChatMessage({required this.message, required this.receiver});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: receiver ? Alignment.centerLeft : Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: size.width * 0.8),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: receiver != true
                    ? const Radius.circular(0)
                    : const Radius.circular(10),
                topLeft: receiver != true
                    ? const Radius.circular(10)
                    : const Radius.circular(0),
                bottomLeft: const Radius.circular(10),
                bottomRight: const Radius.circular(10)),
            color: receiver != true ? color1 : Colors.white,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: receiver != true ? Colors.white : color1,
              fontSize: 15,
              fontFamily: 'GilroyLight',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
