import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medibuddy/constants.dart';

class TypingField extends StatelessWidget {
  TypingField({
    Key? key,
    required this.size,
    required this.controller,
    required this.onSubmitted,
  }) : super(key: key);

  String? _imageUrl;
  Future<File?> pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      return pickedFile != null ? File(pickedFile.path) : null;
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Something went wrong, please try again',
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: color2,
          textColor: Colors.white);
    }
  }

  Future<String?> uploadImage(File file) async {
    try {
      final fileName = file.path.split('/').last;
      final reference = FirebaseStorage.instance.ref().child(fileName);
      final uploadTask = reference.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Something went wrong, please try again',
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: color2,
          textColor: Colors.white);
    }
  }

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
          const Spacer(),
          GestureDetector(
            onTap: () async {
              onSubmitted(isImage: false);
            },
            child: Icon(Icons.send_rounded,
                color: color1, size: size.width * 0.06),
          ),
          SizedBox(width: size.width * 0.05),
          GestureDetector(
            onTap: () async {
              final file = await pickImage();
              if (file != null) {
                final url = await uploadImage(file);
                if (url != null) {
                  _imageUrl = url;
                  controller.text = _imageUrl!;
                  onSubmitted(isImage: true);
                }
              }
            },
            child:
                Icon(Icons.attach_file, color: color1, size: size.width * 0.06),
          ),
          SizedBox(width: size.width * 0.02),
        ],
      ),
    );
  }
}
