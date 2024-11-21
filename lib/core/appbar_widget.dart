

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

PreferredSizeWidget appBarContent({required String title, required VoidCallback onTap}) {
  return AppBar(
    backgroundColor: ColorManager.appBarColor,
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.arrow_forward_rounded,
          color: ColorManager.AppBarContentColor,
        ),
      ),
    ],
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: ColorManager.AppBarContentColor,
        fontSize:14.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Almarai',
      ),
    ),
  );
}
