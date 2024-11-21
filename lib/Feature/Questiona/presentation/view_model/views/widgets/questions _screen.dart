import 'package:flutter/material.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import '../../../../../../core/appbar_widget.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarContent(
        title: "اسئلة و اجوبة",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListView(
          children: [
            QuestionContainer(
              onPressed: () {
                setState(() {
                  isSelected = 1;
                });
              },
              icon: isSelected == 1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              question: 'ما هو لوريم إيبسوم؟',
            ),
            isSelected == 1 ? AnswerText(text: 'لوريم إيبسوم هو نص افتراضي يُستخدم في تصميم الصفحات للطباعة، ولديه تاريخ طويل.') : Container(),
            QuestionContainer(
              onPressed: () {
                setState(() {
                  isSelected = 2;
                });
              },
              icon: isSelected == 2 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              question: 'لماذا يُستخدم لوريم إيبسوم؟',
            ),
            isSelected == 2 ? AnswerText(text: 'لماذا يُفضل المصممون استخدام لوريم إيبسوم؟ لأنه يساعدهم على رؤية كيف سيبدو النص في التصميم.') : Container(),
            QuestionContainer(
              onPressed: () {
                setState(() {
                  isSelected = 3;
                });
              },
              icon: isSelected == 3 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              question: 'ما هي خصائصه الفريدة؟',
            ),
            isSelected == 3 ? AnswerText(text: 'ما هي الميزات الفريدة لنص لوريم إيبسوم؟ يتميز بعدم وجود معنى واضح، مما يمنع تشتيت الانتباه.') : Container(),
            QuestionContainer(
              onPressed: () {
                setState(() {
                  isSelected = 4;
                });
              },
              icon: isSelected == 4 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              question: 'استخدامات أخرى له؟',
            ),
            isSelected == 4 ? AnswerText(text: 'هل يُستخدم لوريم إيبسوم فقط في الطباعة؟ لا، يُستخدم أيضًا في تصميم المواقع الإلكترونية والتطبيقات.') : Container(),
            QuestionContainer(
              onPressed: () {
                setState(() {
                  isSelected = 5;
                });
              },
              icon: isSelected == 5 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              question: 'كيفية الوصول إلى نصه؟',
            ),
            isSelected == 5 ? AnswerText(text: 'كيف يمكن للمستخدمين الوصول إلى نص لوريم إيبسوم؟ يمكنهم استخدام مولدات النصوص المجانية المتاحة عبر الإنترنت.') : Container(),
            QuestionContainer(
              onPressed: () {
                setState(() {
                  isSelected = 6;
                });
              },
              icon: isSelected == 6 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              question: 'هل هناك بدائل؟',
            ),
            isSelected == 6 ? AnswerText(text: 'هل هناك نصوص بديلة يمكن استخدامها؟ نعم، يمكن استخدام نصوص بسيطة أخرى أو نصوص حقيقية حسب الحاجة.') : Container(),
            QuestionContainer(
              onPressed: () {
                setState(() {
                  isSelected = 7;
                });
              },
              icon: isSelected == 7 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              question: 'أين يُستخدم لوريم إيبسوم؟',
            ),
            isSelected == 7 ? AnswerText(text: 'ما هي أشهر استخدامات لوريم إيبسوم؟ يُستخدم بشكل شائع في واجهات المستخدم وفي تصميم النماذج.') : Container(),
            QuestionContainer(
              onPressed: () {
                setState(() {
                  isSelected = 8;
                });
              },
              icon: isSelected == 8 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              question: 'تخصيص نص لوريم إيبسوم؟',
            ),
            isSelected == 8 ? AnswerText(text: 'هل يمكن تخصيص نص لوريم إيبسوم؟ بالتأكيد، يمكنك تغيير النص ليعكس محتوى معين يناسب مشروعك.') : Container(),
          ],
        ),
      ),
    );
  }
}

class AnswerText extends StatelessWidget {
  final String text;

  const AnswerText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        text,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

class QuestionContainer extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String question;

  const QuestionContainer({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(12),
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF302F2D),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: KprimaryColor,
                ),
                height: 40,
                width: 40,
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                question,
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
