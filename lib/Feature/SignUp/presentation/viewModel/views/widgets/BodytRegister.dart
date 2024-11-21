import 'package:flutter/material.dart';
import 'package:homepage/Feature/SignUp/presentation/viewModel/views/widgets/Name.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../login/presentation/view_model/views/LoginPage.dart';
import 'City.dart';
import 'Code.dart';
import 'Email.dart';
import 'Gender.dart';
import 'Passwoed.dart';
import 'Rank.dart';
import 'birthday.dart';

class BodyRegister extends StatefulWidget {
  const BodyRegister({Key? key}) : super(key: key);

  @override
  _BodyRegisterState createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Name(),
            SizedBox(height: screenHeight * 0.010),
            Email(),
            SizedBox(height: screenHeight * 0.010),
            Password(),
            SizedBox(height: screenHeight * 0.010),
            Birthday(),
            SizedBox(height: screenHeight * 0.010),
            City(),
            SizedBox(height: screenHeight * 0.010),
            Gender(),
            SizedBox(height: screenHeight * 0.010),
            Code(),
            SizedBox(height: screenHeight * 0.010),
            Rank(),
            SizedBox(height: screenHeight * 0.010),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
              child: Container(
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
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'انشاء حساب',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.03, top: screenHeight * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: KprimaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    " لدي حساب؟",
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
    );
  }
}
