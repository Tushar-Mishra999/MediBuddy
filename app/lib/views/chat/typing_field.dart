import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';

class TypingField extends StatelessWidget {
  const TypingField({
    Key? key,
    required this.size,
    required this.controller,
    required this.onSubmitted,
  }) : super(key: key);

  final Size size;
  final Function onSubmitted;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color1),
        color: color2,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onEditingComplete: onSubmitted(),
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 15,
                fontFamily: 'GilroyLight',
                fontWeight: FontWeight.bold,
              ),
              onSubmitted: (val) {},
              decoration: const InputDecoration(
                  hintText: "Type a message",
                  border: InputBorder.none,
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 176, 176, 176))),
            ),
          ),
        ],
      ),
    );
  }
}
