import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildImage(
    String assetPath, String discountText, String mainText) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(8.0.r),
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Image.asset(assetPath,
                fit: BoxFit.cover, width: constraints.maxWidth, height: constraints.minHeight),
            Container(
              width: constraints.maxWidth,
              height: constraints.minHeight,
              color: Colors.black.withOpacity(0.5),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        discountText,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 9.5.h),
                  Text(
                    mainText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        );
      }));
}
