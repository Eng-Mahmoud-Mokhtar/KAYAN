import 'package:flutter/material.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import 'package:homepage/Feature/login/presentation/view_model/views/LoginPage.dart';

class NavigationButton extends StatelessWidget {
  final PageController controller;
  final bool onLastPage;

  const NavigationButton({
    Key? key,
    required this.controller,
    required this.onLastPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              if (onLastPage) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }),
                );
              } else {
                controller.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: KprimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.015),
              ),
            ),
            child: SizedBox(
              width: screenWidth * 0.86,
              height: screenWidth * 0.12,
              child: Center(
                child: Text(
                  onLastPage ? 'ابدا رحلتك' : 'التالي',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    // fontFamily: GoogleFonts.almarai().fontFamily,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.025),
        ],
      ),
    );
  }
}
