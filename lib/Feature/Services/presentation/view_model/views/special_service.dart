import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/Academy/presentation/view_model/views/AllAcademy.dart';
import 'package:homepage/Feature/Camera/presentation/view_model/views/AllCamera.dart';
import 'package:homepage/Feature/Services/presentation/view_model/views/widgets/RowServices.dart';
import '../../../../../core/appbar_widget.dart';
import '../../../../../core/colors.dart';
import '../../../../BallPool/presentation/view_model/views/BallPool.dart';
import '../../../../Gym/presentation/view_model/views/pages/AllGyms.dart';
import '../../../../Playground/presentation/view_model/views/Stadiums.dart';
import '../../../../playstation/presentation/view_model/views/AllPlaystation.dart';


class SpecialService extends StatefulWidget {
  const SpecialService({Key? key}) : super(key: key);

  @override
  State<SpecialService> createState() => _SpecialServiceState();
}

class _SpecialServiceState extends State<SpecialService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.Black,
      appBar: appBarContent(
        title: "الخدمات",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildRow(context, [
                {'title': 'حجز ملاعب', 'urlImage': 'images/Service/playground.png', 'page': Stadiums()},
                {'title': 'حجز تصوير', 'urlImage': 'images/Service/camera (2).png', 'page': AllCamera()},
              ]),
              SizedBox(height: 16.h),
              buildRow(context, [
                {'title': 'حجز جيم', 'urlImage': 'images/Service/Group (2).png', 'page': AllGyms()},
                {'title': 'اكاديميات تدريب', 'urlImage': 'images/Service/Group (1).png', 'page': AllAcademy()},
              ]),
              SizedBox(height: 16.h),
              buildRow(context, [
                {'title': 'حجز بلايستيشن', 'urlImage': 'images/Service/Group.png', 'page': AllPlaystation()},
                {'title': 'حجز بليادريو', 'urlImage': 'images/Service/Group (3).png', 'page': AllBallPool()},
              ]),
              SizedBox(height: 16.h),
              buildRow(context, [
                {'title': 'حجز جيم', 'urlImage': 'images/Service/Group (2).png', 'page': AllGyms()},
                {'title': 'اكاديميات تدريب', 'urlImage': 'images/Service/Group (1).png', 'page': AllAcademy()},
              ]),
              SizedBox(height: 16.h),
              buildRow(context, [
                {'title': 'حجز ملاعب', 'urlImage': 'images/Service/playground.png', 'page': Stadiums()},
                {'title': 'حجز تصوير', 'urlImage': 'images/Service/camera (2).png', 'page': AllCamera()},
              ]),
              SizedBox(height: 16.h),
              buildRow(context, [
                {'title': 'حجز ملاعب', 'urlImage': 'images/Service/playground.png', 'page': Stadiums()},
                {'title': 'حجز تصوير', 'urlImage': 'images/Service/camera (2).png', 'page': AllCamera()},
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
