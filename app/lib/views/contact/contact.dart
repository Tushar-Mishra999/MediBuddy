import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medibuddy/constants.dart';
import 'package:medibuddy/views/chat/chat_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/user-provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});
  static const routeName = "/contact-screen";

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<String> contacts = [];
  bool isLoading = true;
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
        int index = user.type == 'client' ? 1 : 0;
        if (documentId.contains(searchString)) {
          contacts.add(documentId.split(':')[index]);
        }
      });
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: Colors.orange.shade800),
            )
          : contacts.isEmpty
              ? const Center(
                  child: Text(
                    "No chats yet",
                    style: TextStyle(
                        fontFamily: 'GilroyBold',
                        color: color1,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.07,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          const Text(
                            'Messaging List',
                            style: TextStyle(
                                fontFamily: 'GilroyBold',
                                color: color1,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        width: size.width * 0.8,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: contacts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ChatScreen.routeName,
                                    arguments: {
                                      'name': contacts[index].split(',')[1],
                                      'chatRoomId': user.type == 'client'
                                          ? "${user.email},${user.name}:${contacts[index].split(',')[0]},${contacts[index].split(',')[1]}"
                                          : "${contacts[index].split(',')[0]},${contacts[index].split(',')[1]}:${user.email},${user.name}",
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  contacts[index].split(',')[1],
                                  style: const TextStyle(
                                      fontFamily: 'GilroyBold',
                                      color: color1,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
