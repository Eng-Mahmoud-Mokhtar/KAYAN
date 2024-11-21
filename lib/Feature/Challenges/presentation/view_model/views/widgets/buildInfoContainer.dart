import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'buildCircleAvatar.dart';

Widget buildInfoContainer(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: screenWidth * 0.04,
      vertical: screenWidth * 0.04,
    ),    child: Container(
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('Cm 159',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white,fontSize: screenWidth *0.03)),
              SizedBox(width: screenWidth * 0.01),
              buildCircleAvatarWithImage('assets/images/Play/Group.png'),
            ],
          ),

          Row(
            children: [
              Text('Kg 50',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white,fontSize: screenWidth *0.03)),
              SizedBox(width: screenWidth * 0.01),
              buildCircleAvatarWithImage(
                  'assets/images/Play/svgexport-10 (50) 1.png'),
            ],
          ),

          Row(
            children: [
              Text('سنة 20',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white,fontSize: screenWidth *0.03)),
              SizedBox(width: screenWidth * 0.01),
              buildCircleAvatarWithImage(
                  'assets/images/Play/svgexport-10 (49) 1.png'),
            ],
          ),
        ],
      ),
    ),
  );
}
