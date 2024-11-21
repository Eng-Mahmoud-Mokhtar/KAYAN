import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/BestSeling/presentation/view_model/views/widgets/best_selling.dart';

import '../../../../core/utiles/constans.dart';

class BestSellingProducts extends StatelessWidget {
  const BestSellingProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>BestSelling (),
                  ));
            },            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: KprimaryColor,
                  size: 17.sp,
                ),
                SizedBox(width: width * 0.03),
                Text(
                  'رؤية المزيد',
                  style: TextStyle(
                    fontSize: width * 0.03,
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                ),
                Expanded(child: SizedBox(width: 10)),
                Text(
                  'منتجات الأكثر مبيعا',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProductItem("images/Service/Group 1000004120.png", "حذاء رياضي","10", width, height),
                SizedBox(width: width * 0.05),
                _buildProductItem("images/Service/Rectangle 10981.png", "حذاء رياضي","10", width, height),
                SizedBox(width: width * 0.05),
                _buildProductItem("images/Service/Group 1000004120.png", "حذاء رياضي","10", width, height),
                SizedBox(width: width * 0.05),
                _buildProductItem("images/Service/Rectangle 10981.png","حذاء رياضي","10", width, height),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(String imagePath, String text, String count, double width, double height) {
    return Container(
      width: width * 0.35,
      height: width * 0.50,
      decoration: BoxDecoration(
        color: Color(0xff2b3227),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: width * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(5.0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(5.0)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Spacer(),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5.h),
          Text(
            count, // Corrected from `int` to `count` as it's a String
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
