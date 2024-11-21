import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotsIndicator extends StatelessWidget {
  final double currentPage;
  final int totalDots;

  const DotsIndicator({
    Key? key,
    required this.currentPage,
    required this.totalDots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalDots,
            (index) => buildDot(index),
      ),
    );
  }

  Widget buildDot(int index) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        width: 8.w,
        height: 8.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6.w),
          color: currentPage == index
              ? const Color(0xff52C234)
              : const Color(0xff9E9E9E),
        ),
      ),
    );
  }
}
