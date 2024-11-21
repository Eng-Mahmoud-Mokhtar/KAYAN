import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import '../../../../Bags/presentation/view_model/views/SportBags.dart';
import '../../../../Balls/presentation/view_model/views/Balls.dart';
import '../../../../Protine/presentation/view_model/views/Protine.dart';
import '../../../../ProudectStadiem/presentation/view_model/views/ProudectStadiem.dart';
import '../../../../SportsClothese/presentation/view_model/views/SportClothese.dart';
import '../../../../SportsShose/presentation/view_model/views/SportShose.dart';
import 'AllStore.dart';

class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

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
                builder: (context) => AllStore(),
              ),
            );
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
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                ),
                Expanded(child: SizedBox(width: width * 0.02)),
                Text(
                  'المتجر',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
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
              "images/Store/Group.png",
              "تجهيزات الملاعب",
                  () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProudectStadiem(),
                ),
              ),
            ),
            SizedBox(width: width * 0.02),
            buildServiceContainer(
              context,
              imageWidth,
              "images/Store/svgexport-17 (90) 1.png",
              "أحذية رياضية",
                  () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SportShose(), // Replace with your page
                ),
              ),
            ),
            SizedBox(width: width * 0.02),
            buildServiceContainer(
              context,
              imageWidth,
              "images/Store/svgexport-17 (71) 1.png",
              "ملابس رياضية",
                  () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SportClothese(), // Replace with your page
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
              "images/Store/Group (2).png",
              "شنط رياضية",
                  () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SportBags(), // Replace with your page
                ),
              ),
            ),
            SizedBox(width: width * 0.02),
            buildServiceContainer(
              context,
              imageWidth,
              "images/Service/Group (1).png",
              "كرة",
                  () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Balls(), // Replace with your page
                ),
              ),
            ),
            SizedBox(width: width * 0.02),
            buildServiceContainer(
              context,
              imageWidth,
              "images/Store/Group (1).png",
              "مكملات غذائية",
                  () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Protine(),
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
