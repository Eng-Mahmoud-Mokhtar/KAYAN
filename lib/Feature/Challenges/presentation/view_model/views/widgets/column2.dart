import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utiles/constans.dart';

Widget Column2(context) {
  var screenWidth = MediaQuery.of(context).size.width;

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AspectRatio(
        aspectRatio: 0.6,
        child: Container(width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.025),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(85, 85, 85, 2.0),
                Color.fromRGBO(40, 40, 40, 1),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: screenWidth * 0.1,
                bottom: screenWidth * 0.56,
                child: Image(
                  image: AssetImage('lib/Vector 3.png'),
                  height: screenWidth * 0.80,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: screenWidth * 0.32,
                top: screenWidth * 0.40,
                child: Image(
                  image: AssetImage('assets/images/Ellipse 491.png'),
                  height: screenWidth * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: screenWidth * 0.38,
                top: screenWidth * 0.44,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '9-10',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'جولات',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/Vector 3.png'),
                        height: screenWidth * 0.25,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'محمود مختار',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(// دائره التوثيق
                left: screenWidth * 0.31,
                top: screenWidth * 0.13,
                child: Image(
                  image: AssetImage('assets/images/Vector.png'),
                  height: screenWidth * 0.08,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(// صح التوثيق
                left: screenWidth * 0.33,
                top: screenWidth * 0.15,
                child: Icon(
                  Icons.done,
                  size: screenWidth * 0.04,
                  color: Colors.white,
                ),
              ),
              Positioned(// دائره حول النتيجه
                left: screenWidth * 0.25,
                top: screenWidth * 0.35,
                child: Image(
                  image: AssetImage('assets/images/Ellipse 489.png'),
                  height: screenWidth * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(// جزء التقييم
                left: screenWidth * 0.39,
                top: screenWidth * 0.9,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.06,
                        backgroundColor: Color.fromRGBO(80, 80, 80, 2),
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 0.03,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(// الشعار والمشاركة
                left: screenWidth * 0.04,
                top: screenWidth * 0.45,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: KprimaryColor,
                      radius: screenWidth * 0.06,
                      child: Image.asset(
                        'assets/images/Al_Ahly_Club-logo-BA70BE3AE8-seeklogo 1 (1).png',
                        height: 20.sp,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.59,
                    ),
                    CircleAvatar(
                      backgroundColor: KprimaryColor,
                      radius: screenWidth * 0.06,
                      child: Center(
                        child: Icon(
                          Icons.share,
                          size: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: screenWidth * 0.04,
                top: screenWidth * 1.15,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: screenWidth * 0.12,
                          width: screenWidth * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              // أضف هنا الوظيفة التي تريدها عند الضغط على الزر
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(255, 255, 255, 0.17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "تقيم التحدي",
                              style: TextStyle(
                                color: KprimaryColor,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        SizedBox(
                          height: screenWidth * 0.12,
                          width: screenWidth * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              // الوظيفة عند الضغط على الزر
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: KprimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "العب معي",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: screenWidth * 0.16,
                          width: screenWidth * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(255, 255, 255, 0.17), // لون الخلفية رمادي
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "المتابعون\n1500", // يمكنك تغيير الرقم هنا
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w400,
                              ),textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        SizedBox(
                          height: screenWidth * 0.16,
                          width: screenWidth * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              // الوظيفة عند الضغط على الزر
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(255, 255, 255, 0.17), // لون الخلفية رمادي
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "يتابع\n2500", // يمكنك تغيير الرقم هنا
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w400,
                              ),textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
