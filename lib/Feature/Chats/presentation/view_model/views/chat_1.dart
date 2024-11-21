import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Chat_1 extends StatefulWidget {
  const Chat_1({Key? key}) : super(key: key);

  @override
  State<Chat_1> createState() => _Chat_1State();
}

class _Chat_1State extends State<Chat_1> {
  TextEditingController text = TextEditingController();
  String myname = 'chat1';
  String hintText = 'اكتب هنا';
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'محمود مختار',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white70,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: PopupMenuButton(
            color: Colors.grey.shade900,
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 30,
            ),
            onSelected: (value) {
              if (value == 'delete') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'تأكيد الحذف',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'هل أنت متأكد من حذف الشات بالكامل؟',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.grey[900],
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'لا',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'نعم',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'delete',
                child: Text(
                  'حذف الرسائل',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/FirstPages/pxfuel.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageBubble(messages[index]);
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.black87,
              height: 80,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                    icon: Icon(
                      Icons.add,
                      color: Color.fromRGBO(52, 174, 50, 1),
                      size: 30,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.right,
                      onChanged: (value) {
                        setState(() {});
                      },
                      cursorColor: Colors.white,
                      controller: text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[900],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        hintText: text.text.isEmpty ? hintText : null,
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _sendMessage(text.text);
                    },
                    icon: Icon(
                      Icons.send,
                      color: Color.fromRGBO(52, 174, 50, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message);
      });
      text.clear();
    }
  }
  Widget _buildMessageBubble(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Color(0xff1D8A20),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(0),
            ),          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 15),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (c) => IntrinsicHeight(
        child: Container(
          height: 135,
          color: Colors.black87,
          child: Column(
            children: [
              SizedBox(height: 5),
              Card(
                color: Colors.grey.shade900,
                child: ListTile(
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  trailing: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  title: Text(
                    'الكاميرا',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Card(
                color: Colors.grey.shade900,
                child: ListTile(
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  trailing: Icon(
                    Icons.photo_library_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'المعرض',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      try {
        var imageFile = File(pickedImage.path);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
