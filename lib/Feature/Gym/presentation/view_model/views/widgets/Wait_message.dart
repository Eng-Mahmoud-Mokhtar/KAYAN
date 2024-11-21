import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';

import '../../../../../Home/presentation/view_model/views/widgets/bottomBar.dart';

class ChangedSuccessfully extends StatefulWidget {
  @override
  _ChangedSuccessfullyState createState() => _ChangedSuccessfullyState();
}

class _ChangedSuccessfullyState extends State<ChangedSuccessfully>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    const delay = Duration(seconds: 5);
    Future.delayed(delay, () {
      showDialog(context: context, builder: (context) => PayedSuccessfully(),);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        width: screenWidth * 0.6,
        height: (screenWidth * 0.9) * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 0.03), // تعديل الحواف ديناميكيًا
          color: Color.fromRGBO(67, 71, 67, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: (screenWidth * 0.9) * 0.2, bottom: (screenWidth * 0.9) * 0.05), // تعديل الـ padding ديناميكيًا
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: (screenWidth * 0.9) * 0.1,
                    width: (screenWidth * 0.9) * 0.1,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(KprimaryColor),
                      strokeWidth: screenWidth * 0.01,
                    ),
                  ),
                  RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                    child: Icon(
                      Icons.hourglass_empty,
                      size: screenWidth * 0.08, // تعديل حجم الأيقونة
                      color: KprimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: (screenWidth * 0.9) * 0.1, bottom: (screenWidth * 0.9) * 0.05), // تعديل الـ padding ديناميكيًا
              child: Text(
                'انتظر رسالة تاكيد الدفع',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class PayedSuccessfully extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // وضع حد أدنى لحجم الشاشة لتجنب الأحجام الصغيرة جداً
    screenWidth = screenWidth < 300 ? 300 : screenWidth;
    screenHeight = screenHeight < 500 ? 500 : screenHeight;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.03), // تعديل الحواف ديناميكيًا
      ),
      backgroundColor: Color.fromRGBO(67, 71, 67, 1),
      content: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.4, // تعديل الارتفاع ديناميكيًا
        child: Column(
          mainAxisSize: MainAxisSize.min, // يضمن أن الحاوية لا تتجاوز المحتوى
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.03),
            Container(
              child: Image.asset(
                "images/Frame 1000004690.png",
                width: screenWidth * 0.5, // التأكد من أن الصورة تتناسب مع العرض
                height: screenHeight * 0.15, // ضبط ارتفاع الصورة
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Flexible( // استخدام Flexible للتأكد من عدم تجاوز العرض
              child: Container(
                width: double.infinity,
                height: screenWidth * 0.10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  color: KprimaryColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(150, 150, 150, 0.1),
                      offset: Offset(0, 15),
                      blurRadius: 40,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Center(
                    child: FittedBox( // استخدام FittedBox لضمان أن النص لا يتجاوز الحواف
                      child: Text(
                        "تتبع الطلب",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.035, // تعديل حجم النص ديناميكيًا
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Flexible( // استخدام Flexible للتأكد من عدم تجاوز العرض
              child: Container(
                width: double.infinity,
                height: screenWidth * 0.10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  border: Border.all(
                    color: KprimaryColor,
                    width: screenWidth * 0.003,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BottomHome(),));
                  },
                  child: FittedBox( // استخدام FittedBox لضمان أن النص لا يتجاوز الحواف
                    child: Text(
                      "العوده الي الصفحه الرئيسيه",
                      style: TextStyle(
                        color: KprimaryColor,
                        fontSize: screenWidth * 0.035, // تعديل حجم النص ديناميكيًا
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
