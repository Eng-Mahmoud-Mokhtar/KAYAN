import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/Home/presentation/view_model/views/widgets/ImageCard.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import 'package:homepage/Feature/Notification/presentation/view_model/views/notification_screen.dart';
import 'package:homepage/Feature/Services/presentation/view_model/views/services.dart';
import '../../../../Academy/presentation/view_model/views/academy.dart';
import '../../../../BestSeling/presentation/view_model/views/Best selling products.dart';
import '../../../../Camera/presentation/view_model/views/Camera.dart';
import '../../../../Gym/presentation/view_model/views/pages/Gym.dart';
import '../../../../NearbyPlaygrpund/presentation/view_model/views/Nearby playgrounds.dart';
import '../../../../Store/presentation/view_model/views/Store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  bool _allowPageScroll = true;
  int _currentPage = 0;
  bool hasNewNotifications = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double desiredHeight = screenWidth * 0.12;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          controller: _pageController,
          physics: _allowPageScroll ? PageScrollPhysics() : NeverScrollableScrollPhysics(),
          children: [
            Scaffold(
              backgroundColor: Colors.black,
              body: SingleChildScrollView(
                physics: _allowPageScroll ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.04,
                    right: screenWidth * 0.04,
                    bottom: screenHeight * 0.02,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: desiredHeight,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(48, 47, 45, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(screenWidth * 0.035),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: SizedBox(width: screenWidth * 0.09)),
                          Container(
                            width: screenWidth * 0.6,
                            height: desiredHeight,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color.fromRGBO(47, 160, 6, 0.0), KprimaryColor],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "البحث عن مكان",
                                hintStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04,
                                  vertical: (desiredHeight - screenWidth * 0.06) / 2,
                                ),
                              ),
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                hasNewNotifications = false; // إخفاء النقطة عند الدخول
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NotificationScreen(),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: desiredHeight,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(48, 47, 45, 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(screenWidth * 0.035),
                                    child: Icon(
                                      Icons.notifications_none,
                                      color: Colors.white,
                                      size: 18.sp,
                                    ),
                                  ),
                                ),
                                if (hasNewNotifications) // عرض النقطة فقط إذا كانت هناك إشعارات جديدة
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: KprimaryColor, // لون النقطة
                                        shape: BoxShape.circle, // شكل دائري
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const ImageCard(),
                      const Services(),
                      const BestSellingProducts(),
                      const NearbyPlayground(),
                      const Store(),
                      const AcademyNearYou(),
                      const Gym(),
                      const Camera(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
