import 'package:flutter/material.dart';

Widget containerService({
  required BuildContext context,
  required String title,
  required String urlImage,
  required VoidCallback onTap,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double containerWidth = screenWidth * 0.4;
  double containerHeight = containerWidth;

  return InkWell(
    onTap: onTap,
    child: Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xff2b3227),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.08,
              height: screenWidth * 0.08,
              child: Image.asset(
                urlImage,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenWidth * 0.03),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Almarai',
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.04,
                height: 1.8,
                letterSpacing: -0.41,
                color: Color.fromRGBO(255, 255, 255, 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
