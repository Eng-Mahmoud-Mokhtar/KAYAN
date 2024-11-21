// import 'dart:async';
// import 'dart:io';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
// import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:record/record.dart';
// import 'package:simple_ripple_animation/simple_ripple_animation.dart';
// import 'package:uuid/uuid.dart';
// import 'openImage.dart';
//
// class Chat_2 extends StatefulWidget {
//   const Chat_2({Key? key}) : super(key: key);
//   @override
//   State<Chat_2> createState() => _Chat_2State();
// }
// class _Chat_2State extends State<Chat_2> {
//   TextEditingController text = TextEditingController();
//   String myname = 'chat2';
//   String hintText = 'اكتب هنا';
//   AudioPlayer audioPlayer = AudioPlayer();
//   final record = AudioRecorder();
//   String path = '';
//   String? currentRecordingId;
//   Directory? appDirectory;
//   bool isRecord = false;
//   bool isPlaying = false;
//   bool isLoading = false;
//   bool isPause = false;
//   bool _isRecording = false;
//   Map<String, bool> audioPlayingStates = {};
//   int recordingMinutes = 0;
//   int recordingSeconds = 0;
//   Timer? timer;
//   Duration duration = new Duration();
//   Duration position = new Duration();
//   @override
//   void initState() {
//     super.initState();
//     text.addListener(() {
//       setState(() {});
//     });
//     _getAppDirectory();
//   }
//   @override
//   void dispose() {
//     super.dispose();
//     _stopTimer();
//     audioPlayer.dispose();
//     if (isPlaying) {
//       stop();
//     }
//   }
//   Future<void> _getAppDirectory() async {
//     appDirectory = await getApplicationDocumentsDirectory();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black87,
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 'الكناني',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               SizedBox(width: 10),
//               CircleAvatar(
//                 radius: 20,
//                 backgroundColor: Colors.grey,
//                 child: Icon(
//                   Icons.person,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.arrow_forward,
//                   color: Colors.white70,
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         ],
//         leading: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: PopupMenuButton(
//             color: Colors.grey.shade900,
//             icon: Icon(
//               Icons.more_vert,
//               color: Colors.white,
//               size: 30,
//             ),
//             onSelected: (value) {
//               if (value == 'delete') {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             'تأكيد الحذف',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       content: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             'هل أنت متأكد من حذف الشات بالكامل؟',
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       backgroundColor: Colors.grey[900],
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text(
//                             'لا',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             FirebaseFirestore.instance
//                                 .collection('messages')
//                                 .get()
//                                 .then((snapshot) {
//                               for (DocumentSnapshot doc in snapshot.docs) {
//                                 doc.reference.delete();
//                               }
//                             }).then((_) {
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(SnackBar(
//                                 content: Text('تم حذف الشات بنجاح'),
//                               ));
//                             }).catchError((error) {
//                               print('حدث خطأ أثناء حذف الشات: $error');
//                             });
//                             Navigator.of(context).pop();
//                           },
//                           child: Text(
//                             'نعم',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               }
//             },
//             itemBuilder: (context) => [
//               PopupMenuItem(
//                 value: 'delete',
//                 child: Text(
//                   'حذف الرسائل',
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: GestureDetector(
//         behavior: HitTestBehavior.translucent,
//         onTap: () {
//           if (_isRecording) {
//             _stopRecording();
//           }
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/FirstPages/pxfuel.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: 10),
//               Expanded(
//                 child: StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection('messages')
//                       .orderBy('timestamp', descending: true)
//                       .snapshots(),
//                   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData) {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                     if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
//                       return Center(
//                         child: Text(
//                           '! لا توجد رسائل',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                           ),
//                         ),
//                       );
//                     }
//                     final messages = snapshot.data!.docs;
//                     messages.forEach((message) {
//                       final senderName = message['sender_name'];
//                       audioPlayingStates[senderName] = false;
//                     });
//                     return ListView.builder(
//                       reverse: true,
//                       itemCount: messages.length,
//                       itemBuilder: (_, index) {
//                         final message = messages[index].data() as Map<String, dynamic>;
//                         final timestamp = message['timestamp'] as Timestamp;
//                         final time = formatTimestamp(timestamp);
//
//                         if (message.containsKey('image_url')) {
//                           final isSender = message['sender_name'] == myname;
//                           return GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => FullScreenImage(
//                                     imageUrl: message['image_url'],
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: Row(
//                               mainAxisAlignment: isSender
//                                   ? MainAxisAlignment.end
//                                   : MainAxisAlignment.start,
//                               children: [
//                                 isSender ? SizedBox() : SizedBox(width: 0),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(vertical: 12.0),
//                                   child: Image.network(
//                                     message['image_url'],
//                                     width: 200,
//                                     height: 200,
//                                   ),
//                                 ),
//                                 isSender ? SizedBox(width: 0) : SizedBox(),
//                               ],
//                             ),
//                           );
//                         } else if (message.containsKey('voice_url')) {
//                           final isSender = message['sender_name'] == myname;
//                           return GestureDetector(
//                             onTap: () {
//                               if (_isRecording) {
//                                 _stopRecording();
//                               }
//                               if (isPlaying) {
//                                 stop();
//                               }
//                               setState(() {
//                                 isPlaying = !isPlaying;
//                               });
//                             },
//                             behavior: HitTestBehavior.translucent,
//                             child: BubbleNormalAudio(
//                               isSender: isSender,
//                               color: isSender
//                                   ? Color.fromRGBO(30, 100, 20, 1)
//                                   : Colors.grey.shade700,
//                               duration: duration.inSeconds.toDouble(),
//                               position: position.inSeconds.toDouble(),
//                               isPlaying: audioPlayingStates[message['voice_url']] ?? false,
//                               isLoading: isLoading,
//                               isPause: isPause,
//                               onSeekChanged: _changeSeek,
//                               onPlayPauseButtonClick: () {
//                                 if (audioPlayingStates[message['voice_url']] ?? false) {
//                                   stop();
//                                 } else {
//                                   play(message['voice_url']);
//                                 }
//                               },
//
//                               tail: true,
//                             ),
//                           );
//                         } else {
//                           final isSender = message['sender_name'] == myname;
//                           return Row(
//                             mainAxisAlignment: isSender
//                                 ? MainAxisAlignment.end
//                                 : MainAxisAlignment.start,
//                             children: [
//                               isSender ? SizedBox() : Padding(padding: EdgeInsets.only(left: 8)),
//                               BubbleSpecialThree(
//                                 isSender: isSender,
//                                 color: isSender
//                                     ? Color.fromRGBO(30, 100, 20, 1)
//                                     : Colors.grey.shade700,
//                                 tail: true,
//                                 textStyle: TextStyle(color: Colors.white, fontSize: 15),
//                                 text: '${message['message']}\n$time\t',
//                               ),
//                               isSender ? Padding(padding: EdgeInsets.only(right: 8)) : SizedBox(),
//                             ],
//                           );
//                         }
//                       },
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 padding: EdgeInsets.all(15),
//                 color: Colors.black87,
//                 height: 80,
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         _showBottomSheet(context);
//                       },
//                       icon: Icon(
//                         Icons.add,
//                         color: Color.fromRGBO(52, 174, 50, 1),
//                         size: 30,
//                       ),
//                     ),
//                     Expanded(
//                       child: TextField(
//                         textAlign: TextAlign.right,
//                         onChanged: (value) {
//                           setState(() {});
//                         },
//                         cursorColor: Colors.white,
//                         controller: text,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.grey[900],
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           hintText: text.text.isEmpty ? hintText : null,
//                           hintStyle: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     _isRecording
//                         ? IconButton(
//                       onPressed: () {
//                         _stopRecording();
//                       },
//                       icon: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             '${recordingMinutes.toString().padLeft(2, '0')}:${recordingSeconds.toString().padLeft(2, '0')}',
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                           SizedBox(width: 8),
//                           RippleAnimation(
//                             repeat: true,
//                             minRadius: 12,
//                             ripplesCount: 6,
//                             color: Colors.green,
//
//                             child: Icon(
//                               Icons.stop,
//                               color: Color.fromRGBO(52, 174, 50, 1),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                         : text.text.isEmpty
//                         ? IconButton(
//                       onPressed: () {
//                         _startRecording();
//                       },
//                       icon: Icon(
//                         Icons.mic,
//                         color: Color.fromRGBO(52, 174, 50, 1),
//                       ),
//                     ): IconButton(
//                       onPressed: () {
//                         _sendMessage(text.text);
//                       },
//                       icon: Icon(
//                         Icons.send,
//                         color: Color.fromRGBO(52, 174, 50, 1),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   void _sendMessage(String message) {
//     if (message.isNotEmpty) {
//       FirebaseFirestore.instance.collection('messages').add({
//         'message': message,
//         'sender_name': myname,
//         'timestamp': Timestamp.now(),
//       }).then((value) {
//         print('Message added to Firestore!');
//         text.clear();
//       }).catchError((error) {
//         print('Failed to add message to Firestore: $error');
//       });
//     }
//   }
//   void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (c) => IntrinsicHeight(
//         child: Container(
//           height: 135,
//           color: Colors.black87,
//           child: Column(
//             children: [
//               SizedBox(height: 5),
//               Card(
//                 color: Colors.grey.shade900,
//                 child: ListTile(
//                   onTap: () {
//                     _pickImage(ImageSource.camera);
//                     Navigator.pop(context);
//                   },
//                   trailing: Icon(
//                     Icons.camera_alt,
//                     color: Colors.white,
//                   ),
//                   title: Text(
//                     'الكاميرا',
//                     textAlign: TextAlign.right,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Card(
//                 color: Colors.grey.shade900,
//                 child: ListTile(
//                   onTap: () {
//                     _pickImage(ImageSource.gallery);
//                     Navigator.pop(context);
//                   },
//                   trailing: Icon(
//                     Icons.photo_library_outlined,
//                     color: Colors.white,
//                   ),
//                   title: Text(
//                     'المعرض',
//                     textAlign: TextAlign.right,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: source);
//     if (pickedImage != null) {
//       try {
//         var imageFile = File(pickedImage.path);
//         var snapshot = await FirebaseStorage.instance
//             .ref()
//             .child('chat_images/${DateTime.now().millisecondsSinceEpoch}')
//             .putFile(imageFile);
//         var downloadUrl = await snapshot.ref.getDownloadURL();
//         FirebaseFirestore.instance.collection('messages').add({
//           'sender_name': myname,
//           'image_url': downloadUrl,
//           'timestamp': Timestamp.now(),
//         }).then((value) {
//           print('Image added to Firestore!');
//         }).catchError((error) {
//           print('Failed to add image to Firestore: $error');
//         });
//       } catch (e) {
//         print(e.toString());
//       }
//     }
//   }
//   void _startRecording() async {
//     if (!isRecord) {
//       final location = await getApplicationDocumentsDirectory();
//       String name = Uuid().v1();
//       if (await record.hasPermission()) {
//         if (currentRecordingId != null) {
//           await record.stop();
//         }
//         await record.start(RecordConfig(), path: location.path + name + '.m4a');
//         setState(() {
//           isRecord = true;
//           _isRecording = true;
//           recordingMinutes = 0;
//           recordingSeconds = 0;
//           isRecord = true;
//         });
//         _startTimer();
//       }
//     }
//   }
//   play(String url) async {
//     if (isPlaying) {
//       stop();
//     }
//
//     await audioPlayer.play(UrlSource(url));
//     setState(() {
//       isPlaying = true;
//       audioPlayingStates[url] = true;
//     });
//
//     audioPlayer.onDurationChanged.listen((Duration d) {
//       setState(() {
//         duration = d;
//         isLoading = false;
//       });
//     });
//     audioPlayer.onPositionChanged.listen((Duration p) {
//       setState(() {
//         if (duration != null) {
//           position = Duration(
//             seconds: p.inSeconds <= duration.inSeconds
//                 ? p.inSeconds
//                 : duration.inSeconds,
//           );
//         }
//       });
//     });
//     audioPlayer.onPlayerComplete.listen((event) {
//       setState(() {
//         isPlaying = false;
//         duration = const Duration();
//         position = const Duration();
//       });
//     });
//   }
//   void _changeSeek(double newValue) {
//     setState(() {
//       position = Duration(seconds: newValue.toInt());
//     });
//   }
//
//   void stop() async {
//     // إيقاف التسجيل الحالي
//     await audioPlayer.stop();
//     setState(() {
//       isPlaying = false;
//       // إعادة ضبط حالة التشغيل للتسجيلات الصوتية الأخرى
//       audioPlayingStates.forEach((key, value) {
//         audioPlayingStates[key] = false;
//       });
//     });
//   }
//   void _stopRecording() async {
//     if (isRecord) {
//       String? final_path = await record.stop();
//       setState(() {
//         path = final_path!;
//         isRecord = false;
//         _isRecording = false;
//         isRecord = false; // Update recording status flag
//       });
//       _stopTimer();
//       upload(path, myname, 'm4a');
//     }
//   }
//   void updateAudioPosition(double newValue) {
//     setState(() {
//       position = Duration(seconds: newValue.toInt());
//     });
//   }
//   void _startTimer() {
//     const oneSec = Duration(seconds: 1);
//     timer = Timer.periodic(
//       oneSec,
//           (Timer timer) {
//         setState(() {
//           recordingSeconds = recordingSeconds + 1;
//           if (recordingSeconds == 60) {
//             recordingMinutes = recordingMinutes + 1;
//             recordingSeconds = 0;
//           }
//         });
//       },
//     );
//   }
//   void _stopTimer() {
//     timer?.cancel();
//   }
//   void upload(String path, String senderName, String format) async {
//     try {
//       final ref = FirebaseStorage.instance.ref('voice/${DateTime.now().millisecondsSinceEpoch}');
//       await ref.putFile(File(path));
//
//       final downloadUrl = await ref.getDownloadURL();
//
//       // أضف التسجيل الصوتي مع البيانات المرتبطة به إلى Firestore
//       await FirebaseFirestore.instance.collection('voice_recordings').add({
//         'sender_name': senderName,
//         'voice_url': downloadUrl,
//         'timestamp': Timestamp.now(),
//         'voice_format': format,
//         // يمكنك إضافة المزيد من الخصائص إذا كنت بحاجة إليها
//       });
//
//       print('Voice recording added to Firestore!');
//     } catch (e) {
//       print('Error uploading recording: $e');
//     }
//   }
//   String formatTimestamp(Timestamp timestamp) {
//     DateTime dateTime = timestamp.toDate();
//     String period = dateTime.hour < 12 ? 'ص' : 'م';
//     int hour = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
//     String hourStr = hour.toString().padLeft(2);
//     String minuteStr = dateTime.minute.toString().padLeft(2, '0');
//     return '$hourStr:$minuteStr $period';
//   }
// }
