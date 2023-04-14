import 'package:flutter/material.dart';
import '../../constants.dart';

class RoundedSearchBar extends StatelessWidget {
  final String hintText;
   final ValueChanged<String> onSubmitted;
   final ValueChanged<String> onChanged;
  const RoundedSearchBar({
    Key? key,
    required this.hintText,
    required this.onSubmitted,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color2,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.search, color: Color.fromARGB(255, 176, 176, 176)),
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 15,
                fontFamily: 'GilroyLight',
                fontWeight: FontWeight.bold,
              ),
              onSubmitted: onSubmitted,
              onChanged: onChanged,
              decoration: InputDecoration(
                  hintText: hintText,
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
