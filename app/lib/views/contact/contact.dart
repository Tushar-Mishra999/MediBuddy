import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../provider/user-provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<String> contacts = [];

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserProvider>(context, listen: false).user;
    FirebaseFirestore.instance
        .collection('chats')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        String documentId = doc.id;
        String searchString = user.email;
        int index = user.status == 'client' ? 1 : 0;
        if (documentId.contains(searchString)) {
            contacts.add(documentId.split(':')[index]);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
