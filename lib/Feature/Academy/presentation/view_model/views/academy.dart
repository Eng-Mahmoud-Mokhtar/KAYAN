import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/Academy/presentation/view_model/views/widgets/DetailesAcademy.dart';
import '../../../../core/utiles/constans.dart';
import 'AllAcademy.dart';

class AcademyNearYou extends StatelessWidget {
  const AcademyNearYou({Key? key}) : super(key: key);

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
                      builder: (context) => AllAcademy(),
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
                'الاكاديميات',
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
                  "images/academy/full-shot-kids-playing-football-together.jpg",
                  "اكاديميه اسكور",
                  width,
                  height,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailsAcademy(
                          AcademyName: "اكاديميه اسكور",
                          location: "القاهرة",
                          price: "950",
                          imagePath: "images/academy/full-shot-kids-playing-football-together.jpg",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: width * 0.05),
                _buildImageContainer(
                  "images/academy/man-training-kids-playing-football-full-shot.jpg", // صورة الخلفية
                  "اكاديميه فوتبولر",
                  width,
                  height,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailsAcademy(
                          AcademyName: "اكاديميه فوتبولر",
                          location: "الجيزة",
                          price: "650",
                          imagePath: "images/academy/man-training-kids-playing-football-full-shot.jpg",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: width * 0.05),
                _buildImageContainer(
                  "images/academy/girl-taking-swiming-lesson-male-coach-dad-helping-her-with-goggles-while-swimming.jpg", // صورة الخلفية
                  "اكاديميه الغواصين",
                  width,
                  height,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailsAcademy(
                          AcademyName: "اكاديميه الغواصين",
                          location: "القاهرة",
                          price: "1200",
                          imagePath: "images/academy/girl-taking-swiming-lesson-male-coach-dad-helping-her-with-goggles-while-swimming.jpg",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: width * 0.05),
                _buildImageContainer(
                  "images/academy/young-basketball-players-playing-one-one.jpg",
                  "اكاديميه السله",
                  width,
                  height,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsAcademy(
                          AcademyName:"اكاديميه السله",
                          location: "الجيزة",
                          price: "1300",
                          imagePath: "images/academy/young-basketball-players-playing-one-one.jpg",
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
