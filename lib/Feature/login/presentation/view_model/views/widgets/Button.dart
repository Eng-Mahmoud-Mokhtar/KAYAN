import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Home/presentation/view_model/views/widgets/bottomBar.dart';
import '../../../../../core/utiles/constans.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
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
              builder: (context) => BottomHome(),
            ),
          );
        },
        child: Text(
          'تسجيل الدخول',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: screenWidth * 0.04,
          ),
        ),
      ),
    );
  }
}
