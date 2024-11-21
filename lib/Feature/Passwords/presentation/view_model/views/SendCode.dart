import 'package:flutter/material.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import '../../../../../core/appbar_widget.dart';
import 'widgets/buildCodeDigitField.dart';
import 'new_password.dart';

class SendCode extends StatefulWidget {
  const SendCode({Key? key}) : super(key: key);

  @override
  State<SendCode> createState() => _SendCodeState();
}

class _SendCodeState extends State<SendCode> {
  List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarContent(
        title: "كود التأكيد",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.1, bottom: screenHeight * 0.02),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/FirstPages/image 1301.png'),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.2,
                  ),
                ),
              ),
              Text(
                'قم باضافة 4 ارقام الكود التي ارسلت اليك علي',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w400,
                ),textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.00150),
              Text(
                'ahmed1929@gmail.com',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: screenHeight * 0.010),
              CodeFieldsWidget(),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " ارسال كود اخر",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: KprimaryColor,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: KprimaryColor,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPassword(),
                      ),
                    );
                  },
                  child: Text(
                    'تأكيد',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
