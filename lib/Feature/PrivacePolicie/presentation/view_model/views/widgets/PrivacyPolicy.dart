import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utiles/constans.dart';
import '../../../../../../core/appbar_widget.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: appBarContent(
        title: "سياسة الخصوصية",
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
                    'assets/images/policy.png', // الصورة
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
                    'نحن نولي أهمية كبيرة لخصوصيتك ونلتزم بحماية معلوماتك الشخصية',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'تهدف سياسة الخصوصية هذه إلى إطلاعك على كيفية جمع واستخدام المعلومات عندما تستخدم تطبيقنا',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'نقوم بجمع معلوماتك فقط لتحسين تجربتك في التطبيق',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'نحمي معلوماتك الشخصية ولن نشاركها مع أي شخص دون إذنك',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Container(
                width: screenWidth,
                height: screenWidth * 0.12,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KprimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'موافق',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.04
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
