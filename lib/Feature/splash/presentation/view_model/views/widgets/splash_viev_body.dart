import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../Boardring/presentation/view_model/views/OnBoardring.dart';
import '../../../../../core/utiles/Assets_Data.dart';
import '../../../../../core/utiles/constans.dart';
class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const delay = Duration(seconds: 5);

    Future.delayed(delay).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    });

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Spacer(),
          Center(
            child: Image.asset(
              AssetsData.Logo,
              width: 200.w,
              height: 200.h,
              fit: BoxFit.contain,
            ),
          ),
          Spacer(),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 70.h),
            child: SpinKitThreeBounce(
              color: KprimaryColor,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
