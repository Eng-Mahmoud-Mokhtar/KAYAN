import 'package:flutter/material.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.06,horizontal: screenWidth * 0.04),
          child: Padding(
            padding:  EdgeInsets.only(bottom: screenHeight * 0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Image.asset(
                  'assets/FirstPages/Group 1000004413.png',
                  height: screenHeight * 0.5,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'انضم الينا وابدا رحلتك الرياضية',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign:  TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign:  TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}