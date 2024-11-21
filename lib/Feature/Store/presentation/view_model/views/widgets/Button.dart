import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';

class Buttoms extends StatelessWidget {
  const Buttoms({super.key, required this.buttomtext, required this.width, required this.onPressed});
  final String? buttomtext ;
  final double width ;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return TextButton(
        onPressed: onPressed,
        child:Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: KprimaryColor,
          ),
          width: double.infinity,
          height: screenWidth * 0.12,
          child: Center(
            child: Text(
              buttomtext!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400
              ),
            ),
          ),
        ),
    );
  }
}
