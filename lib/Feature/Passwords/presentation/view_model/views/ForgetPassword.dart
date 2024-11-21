import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/appbar_widget.dart';
import '../../../../core/utiles/constans.dart';
import 'SendCode.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    TextEditingController forgetPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarContent(
        title: "نسيت كلمة السر",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image(
                  image: AssetImage('assets/FirstPages/Frame 1000004661.png'),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'الايميل ',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.010),
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.12,
                        child: TextField(
                          controller: forgetPasswordController,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(50, 50, 50, 2),
                            hintText: 'اكتب الايميل',
                            hintStyle: TextStyle(color: Colors.grey,
                              fontSize: screenWidth * 0.03,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: screenWidth * 0.02),
                              child: Icon(
                                Icons.person_outline_rounded,
                                color: Colors.white70,
                                size: 18.sp,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: KprimaryColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Container(
                    width: screenWidth,
                    height: screenWidth * 0.12,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: KprimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SendCode(),
                          ),
                        );
                      },
                      child: Text(
                        'ارسل الكود',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
