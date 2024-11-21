import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/Gym/presentation/view_model/views/pages/Detailes.dart';
import 'package:homepage/Feature/Gym/presentation/view_model/views/pages/AllGyms.dart';
import '../../../../../core/utiles/constans.dart';



class Gym extends StatelessWidget {
  const Gym({Key? key}) : super(key: key);

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
                      builder: (context) => AllGyms(),
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
                'الجيم',
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
                  "images/Gym/young-sportive-man-is-doing-exercises-with-dumbbells-empty-gym-club.jpg",
                  "هيرو جيم",
                  width,
                  height,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Details(
                          GymName: "هيرو جيم",
                          location: "القاهرة",
                          price: "150",
                          imagePath: "images/Gym/young-sportive-man-is-doing-exercises-with-dumbbells-empty-gym-club.jpg",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: width * 0.05),
                _buildImageContainer(
                  "images/Gym/sportsman-doing-squats-gym.jpg",
                  "جولدز جيم",
                  width,
                  height,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          GymName: "جولدز جيم",
                          location: "الجيزة",
                          price: "170",
                          imagePath: "images/Gym/sportsman-doing-squats-gym.jpg",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: width * 0.05),
                _buildImageContainer(
                  "images/Gym/portrait-young-sportsman-making-cardio-workout-drinking-water-gym.jpg",
                  "فيتنس جيم",
                  width,
                  height,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Details(
                          GymName: "فيتنس جيم",
                          location: "مدينة نصر",
                          price: "500",
                          imagePath: "images/Gym/portrait-young-sportsman-making-cardio-workout-drinking-water-gym.jpg",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: width * 0.05),
                _buildImageContainer(
                  "images/Gym/full-body-portrait-athletic-shirtless-male-doing-biceps-workouts-with-dumbbells-gym-club.jpg",
                  "باور تايم جيم",
                  width,
                  height,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Details(
                          GymName: "باور تايم جيم",
                          location: "كفرالشيخ",
                          price: "180",
                          imagePath: "images/Gym/full-body-portrait-athletic-shirtless-male-doing-biceps-workouts-with-dumbbells-gym-club.jpg",
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

