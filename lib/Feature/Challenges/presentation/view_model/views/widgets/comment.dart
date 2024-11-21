import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentBottomSheet extends StatefulWidget {
  @override
  _CommentBottomSheetState createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  bool isMessageIconPressed = false;
  TextEditingController _commentController = TextEditingController();

  final List<Map<String, String>> commentsList = [
    {
      'username': 'محمود مختار',
      'comment': 'ما رأيكم في هذه الفكرة؟ أعتقد أنها ممتازة.'
    },
    {
      'username': 'علي أحمد',
      'comment': 'تجربتي كانت رائعة، أوصي بهذا جدًا.'
    },
    {
      'username': 'سارة حسين',
      'comment': 'هل يمكنني معرفة المزيد عن هذا الموضوع؟'
    },
    {
      'username': 'أميرة الجندي',
      'comment': 'لقد أعجبتني الفيديوهات التي تنشرها.'
    },
  ];

  void _addComment(String username, String comment) {
    setState(() {
      commentsList.add({'username': username, 'comment': comment});
      _commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isMessageIconPressed ? Colors.black : Color.fromRGBO(67, 71, 67, 2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 5,
            blurRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          // عرض التعليقات الحالية
          Expanded(
            child: ListView.builder(
              itemCount: commentsList.length,
              itemBuilder: (context, index) {
                var comment = commentsList[index];
                return Column(
                  children: [
                    CommentWidget(
                      username: comment['username']!,
                      comment: comment['comment']!,
                    ),
                    Divider(
                      indent: 40, // تثبيت القيم
                      endIndent: 40,
                      thickness: 1,
                      color: Colors.grey.shade500,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), // تثبيت padding
            child: Row(
              children: [
                IconButton(
                  icon: Image.asset('assets/images/sendmessage.png'),
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      _addComment('وهمي', _commentController.text);
                    }
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: '...تعليق',
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Color.fromRGBO(239, 255, 239, 0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10), // تحديد padding ثابت
                    ),
                    textAlign: TextAlign.right, // النص يبدأ من اليمين
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16, // تثبيت حجم النص
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // تثبيت الارتفاع
        ],
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  final String username;
  final String comment;

  CommentWidget({
    required this.username,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15), // تثبيت padding
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // يضمن أن التعليق يبدأ من أعلى الريد
        mainAxisAlignment: MainAxisAlignment.end, // يضمن محاذاة جميع العناصر إلى اليمين
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10), // تثبيت القيم
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end, // النصوص تبدأ من اليمين
              children: [
                Text(
                  username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16, // تثبيت حجم الخط
                    fontWeight: FontWeight.w600,
                  ),textAlign: TextAlign.right,
                ),
                SizedBox(height: 5),
                Container(
                  width: 250, // تثبيت العرض
                  child: Text(
                    comment,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14, // تثبيت حجم الخط
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right, // جعل التعليق يبدأ من اليمين
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 24, // تثبيت حجم الصورة
            backgroundImage: AssetImage('assets/images/Play/Ellipse 495.png'),
          ),
        ],
      ),
    );
  }
}
