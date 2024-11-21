import 'package:flutter/material.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import 'package:homepage/Feature/login/presentation/view_model/views/widgets/Button.dart';
import 'package:homepage/Feature/login/presentation/view_model/views/widgets/Email.dart';
import 'package:homepage/Feature/login/presentation/view_model/views/widgets/Password.dart';
import '../../../../Passwords/presentation/view_model/views/ForgetPassword.dart';
import '../../../../SignUp/presentation/viewModel/views/ResgisterPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image(
              image: AssetImage('assets/FirstPages/Ellipse 508.png'),
              width: screenWidth * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment(0, -0.8),
            child: Image(
              image: AssetImage('assets/FirstPages/Group 1000004348.png'),
              width: screenWidth * 0.5,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.3),
                  Email(),
                  SizedBox(height: screenHeight * 0.02),
                  Password(),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgetPassword(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "نسيت كلمة السر",
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            color: KprimaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Button(),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.02, top: screenHeight * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const ResgisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            "انشاء حساب",
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: KprimaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          "  ليس لدي حساب؟",
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
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
