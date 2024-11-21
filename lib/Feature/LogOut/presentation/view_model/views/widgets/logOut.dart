import 'package:flutter/material.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import '../../../../../login/presentation/view_model/views/LoginPage.dart';

class LogoutAlertDialog {
  void signOut(BuildContext context) {
    try {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  void deploy(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Color.fromRGBO(67, 71, 67, 1),
          content: Container(
            width: screenWidth * 0.6,
            height: (screenWidth * 0.9) * 0.6,
            child: Column(
              children: [
                Center(
                  child: Container(
                    child: Icon(
                      Icons.login_outlined,
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    ),
                    height: screenWidth * 0.12,
                    width: screenHeight * 0.12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF5C6959),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                  'هل أنت متأكد من تسجيل الخروج من التطبيق؟',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.04,  // حجم النص يعتمد على عرض الشاشة
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text(
                          'الغاء',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.04,  // حجم النص في الزر
                            color: KprimaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.05,  // مسافة بين الزرارين
                    ),
                    GestureDetector(
                      onTap: () {
                        signOut(context);
                      },
                      child: Container(
                        height: screenHeight * 0.09,
                        width: screenWidth * 0.3,
                        decoration: BoxDecoration(
                          color: KprimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
