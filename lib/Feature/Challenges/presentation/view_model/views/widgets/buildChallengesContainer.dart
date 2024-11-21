import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';

Widget buildChallengesContainer(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: screenWidth * 0.04,
      vertical: screenWidth * 0.04,
    ),
    child: Column(
      children: [
        Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.06,
                      backgroundImage: AssetImage('assets/images/Play/Ellipse 495.png'),
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    Text(
                      'محمد فهمي',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w400,),
                    )
                  ],
                ),
                Text(
                  '9 - 10',
                  style: TextStyle(
                      color: KprimaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.w600,), // مثال، يمكن تعديل القيمة حسب الحاجة
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.06,
                      backgroundImage: AssetImage('assets/images/Play/Vector 3.png'),
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    Text(
                      'محمود مختار',
                      style: TextStyle(
                          color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w400,),
                    )
                  ],
                ),
              ],
            ),
        SizedBox(height: screenWidth * 0.05),
      ],
    ),
  );
}
