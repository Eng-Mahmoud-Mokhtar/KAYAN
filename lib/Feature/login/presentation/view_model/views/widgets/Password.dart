import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utiles/constans.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}
bool isPasswordVisible = false;

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'الرقم السري ',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
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
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.right,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(50, 50, 50, 2),
              hintText: 'اكتب الرقم السري',
              hintStyle: TextStyle(color: Colors.grey,
                fontSize: screenWidth * 0.035,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.02),
                  child: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey.shade700,
                    size: screenWidth * 0.05,

                  ),
                ),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.02),
                child: Icon(
                  Icons.lock_outlined,
                  size: screenWidth * 0.05,
                  color: Colors.white70,
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
    );
  }
}
