import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/Camera/presentation/view_model/views/AllCamera.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import 'package:homepage/Feature/Services/presentation/view_model/views/special_service.dart';
import '../../../../Academy/presentation/view_model/views/AllAcademy.dart';
import '../../../../BallPool/presentation/view_model/views/BallPool.dart';
import '../../../../Gym/presentation/view_model/views/pages/AllGyms.dart';
import '../../../../Playground/presentation/view_model/views/Stadiums.dart';
import '../../../../playstation/presentation/view_model/views/AllPlaystation.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double imageWidth = width * 0.29;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpecialService(),
                ));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: KprimaryColor,
                  size: 17.sp,
                ),
                SizedBox(width: width * 0.02),
                Text(
                  'رؤية المزيد',
                  style: TextStyle(
                      fontSize: width * 0.03,
                      color: Color.fromRGBO(255, 255, 255, 0.7)),
                ),
                Expanded(child: SizedBox(width: width * 0.02)),
                Text(
                  'خدمات',
                  style: TextStyle(
                      fontSize: width * 0.04,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildServiceContainer(
              context,
              imageWidth,
              "images/Service/camera (2).png",
              "حجز تصوير",
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllCamera(), // Replace with your page
                ),
              ),
            ),
            SizedBox(width: width * 0.02),
            buildServiceContainer(
              context,
              imageWidth,
              "images/Service/playground.png",
              "حجز ملاعب",
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Stadiums(), // Replace with your page
                ),
              ),
            ),
            SizedBox(width: width * 0.02),
            buildServiceContainer(
              context,
              imageWidth,
              "images/Service/Group.png",
              "حجز بلايستيشن",
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AllPlaystation(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildServiceContainer(
              context,
              imageWidth,
              "assets/FirstPages/flag_15642285.png",
              "اكاديميات تدريب",
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllAcademy(),
                ),
              ),
            ),
            SizedBox(width: width * 0.02),
            buildServiceContainer(
              context,
              imageWidth,
              "images/Service/Group (2).png",
              "حجز جيم",
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllGyms(),
                ),
              ),
            ),
            SizedBox(width: width * 0.02),
            buildServiceContainer(
              context,
              imageWidth,
              "images/Service/Group (3).png",
              "حجز بليادريو",
                    () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllBallPool(),
                ),
            ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildServiceContainer(
    BuildContext context,
    double width,
    String imagePath,
    String text,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: width * 1.0,
        decoration: BoxDecoration(
          color: Color(0xff2b3227),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final containerWidth = constraints.maxWidth;
            final imageSize = containerWidth * 0.3;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
