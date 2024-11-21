import 'package:flutter/material.dart';
import 'package:homepage/Feature/Boardring/presentation/view_model/views/widgets/NavigationButton.dart';
import 'package:homepage/Feature/Boardring/presentation/view_model/views/widgets/OnBoarding3.dart';
import 'package:homepage/Feature/Boardring/presentation/view_model/views/widgets/buildDot.dart';
import 'widgets/OnBoarding1.dart';
import 'widgets/OnBoarding2.dart';
import '../../../../core/utiles/constans.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  double currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page!;
        onLastPage = currentPage == 2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                currentPage = index.toDouble();
                onLastPage = (index == 2);
              });
            },
            children: const [
              OnBoarding1(),
              OnBoarding2(),
              OnBoarding3(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.0125), // 10 بالنسبة لارتفاع 800
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DotsIndicator(currentPage: currentPage, totalDots: 3),
                  SizedBox(height: screenHeight * 0.025), // 20 بالنسبة لارتفاع 800
                  NavigationButton(
                    controller: _controller,
                    onLastPage: onLastPage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
