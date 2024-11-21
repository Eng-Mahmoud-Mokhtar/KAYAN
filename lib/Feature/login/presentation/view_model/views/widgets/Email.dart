import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utiles/constans.dart';

class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'الايميل',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.010),
        Container(
          width: screenWidth,
          height: screenWidth * 0.12,
          child: TextField(
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(50, 50, 50, 2),
              hintText: 'اكتب الايميل',
              hintStyle: TextStyle(color: Colors.grey,
                fontSize: screenWidth * 0.035,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.02),
                child: Icon(
                  Icons.person_outline_rounded,
                  color: Colors.white70,
                  size: screenWidth * 0.05,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: KprimaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
