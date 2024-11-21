import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/appbar_widget.dart';

class Conditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: appBarContent(
        title: "البنود والظروف",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              ClipOval(
                child: Container(
                  color: Color(0xff36363e), // اللون الرمادي للحاوية
                  child: Image.asset(
                    'images/svgexport-17 - 2023-10-22T211203.652 1.png', // الصورة
                    width: 70, // عرض الدائرة
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02, // 2% من ارتفاع الشاشة
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end, // محاذاة النص لليمين
                children: [
                  Text(
                    'تعتبر هذه البنود والظروف اتفاقًا ملزمًا بينك وبيننا بشأن استخدام تطبيقنا.',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'يرجى قراءة هذه البنود بعناية قبل استخدام التطبيق، حيث إن استخدامك للتطبيق يعني موافقتك على الالتزام بها.',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'نحتفظ بالحق في تعديل هذه البنود في أي وقت، وستكون التغييرات سارية بمجرد نشرها على التطبيق.',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'يجب عليك مراجعة هذه البنود بشكل دوري للتأكد من اطلاعك على أي تغييرات.',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
