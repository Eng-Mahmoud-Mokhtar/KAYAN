import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/NearbyPlaygrpund/presentation/view_model/views/widgets/playgrounds_near.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import 'widgets/DetailesNearby.dart';

class NearbyPlayground extends StatelessWidget {
  const NearbyPlayground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaygroundsNear(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: KprimaryColor,
                      size: width * 0.04,
                    ),
                    SizedBox(width: width * 0.03),
                    Text(
                      'رؤية المزيد',
                      style: TextStyle(
                        fontSize: width * 0.03,
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox(width: width * 0.02)),
              Text(
                'ملاعب بالقرب منك',
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildImageContainer(
                  "images/o_s_6_758_sultan-ibrahim-larki-1.jpg",
                  "ملعب اسبيرو",
                  width,
                  height,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailesNearby(
                          playgroundName: "ملعب اسبيرو",
                          location: "القاهرة",
                          price: "150",
                          imagePath: "images/o_s_6_758_sultan-ibrahim-larki-1.jpg",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: width * 0.05),
                _buildImageContainer(
                  "images/Rectangleplayground.png",
                  "ملعب فيوتشر",
                  width,
                  height,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailesNearby(
                          playgroundName: "ملعب فيوتشر",
                          location: "الجيزة",
                          price: "200",
                          imagePath: "images/Rectangleplayground.png",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: width * 0.05),
                _buildImageContainer(
                  "images/o_s_6_758_sultan-ibrahim-larki-1.jpg",
                  "ملعب الأهلي",
                  width,
                  height,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailesNearby(
                          playgroundName: "ملعب الأهلي",
                          location: "مدينة نصر",
                          price: "500",
                          imagePath: "images/o_s_6_758_sultan-ibrahim-larki-1.jpg",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: width * 0.05),
                _buildImageContainer(
                  "images/Rectangleplayground.png",
                  "ملعب الزمالك",
                  width,
                  height,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailesNearby(
                          playgroundName: "ملعب الزمالك",
                          location: "الشيخ زايد",
                          price: "180",
                          imagePath: "images/Rectangleplayground.png",
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(String imagePath, String text, double width, double height, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              decoration: const BoxDecoration(
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}


