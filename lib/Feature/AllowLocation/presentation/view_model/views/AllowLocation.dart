import 'package:flutter/material.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';

import '../../../../Home/presentation/view_model/views/widgets/bottomBar.dart';

class AllowLocation extends StatelessWidget {
  const AllowLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.06, bottom: screenHeight * 0.02),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/FirstPages/Group 1000004423.png'),
                    width: screenWidth * 0.6,
                    // Adjust the width if necessary
                  ),
                ),
              ),
              Text(
                'السماح بالموقع',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'يساعدنا في اقتراح اماكن الملاعب القريبة منك وايضا الاشخاص في نفس منطقتك',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.7),
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
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
                        builder: (context) => BottomHome(),
                      ),
                    );
                  },
                  child: Text(
                    'نعم',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.020),
              Container(
                width: screenWidth,
                height: screenWidth * 0.12,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(67, 71, 67, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomHome(),
                      ),
                    );
                  },
                  child: Text(
                    'تخطي',
                    style: TextStyle(
                      color: KprimaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.04,
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
