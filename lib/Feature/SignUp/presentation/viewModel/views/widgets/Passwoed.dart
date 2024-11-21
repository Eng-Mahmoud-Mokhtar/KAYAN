import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utiles/constans.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'كلمة السر',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
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
              hintStyle: TextStyle(
                color: Colors.grey,
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
