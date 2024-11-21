import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import '../../../../../../core/appbar_widget.dart';

class Points extends StatelessWidget {
  const Points({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarContent(
        title: "النقاط",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image(
                          image: AssetImage('assets/images/Account/Points.png')),
                      SizedBox(height: 10),
                      Text(
                        '1200',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'نقطة',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                height: screenWidth * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(36, 36, 36, 1),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'سوف تحصل علي',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'جنية',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '200',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          width: screenWidth* 0.08,
                          height: screenWidth * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(82, 194, 52, 0.1)),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: KprimaryColor,
                                size: 15.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'عدد النقاط',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 0.04,
                              color: Colors.white70,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'نقطة',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '1200',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'شارك الكود لتكسب',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: screenWidth * 0.15,
                child: DottedBorder(
                dashPattern: [10, 4],
                  color: Color.fromRGBO(103, 104, 109, 1),
                  strokeWidth: 2,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  child: Container(
                    width: screenWidth,
                    height: screenWidth * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(36, 36, 36, 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: '874392kd'));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.gpp_good_outlined,
                                        color: KprimaryColor,
                                        size: 18.sp,
                                      ),
                                      Text(
                                        'تم نسخ الكود',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: screenWidth * 0.04,
                                          color: KprimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  'نسخ الكود',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w400,
                                    color: KprimaryColor,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Icon(
                                  Icons.copy,
                                  color: KprimaryColor,
                                  size: 18.sp,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '874392kd',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'عدد مرات تحميل الكود :-  4 مرات',
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
