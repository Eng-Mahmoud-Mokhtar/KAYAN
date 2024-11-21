import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/appbar_widget.dart';
import '../../../../../core/utiles/constans.dart';

class MyPrivateAccount extends StatefulWidget {
  final String userName;
  final String email;
  final String phoneNumber;

  MyPrivateAccount(
      {required this.userName, required this.email, required this.phoneNumber});

  @override
  _MyPrivateAccountState createState() => _MyPrivateAccountState();
}

class _MyPrivateAccountState extends State<MyPrivateAccount> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarContent(
        title: "الملف الشخصي",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.04),
            Container(
              width: screenWidth * 0.25,
              height: screenWidth * 0.25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: KprimaryColor, width: screenWidth * 0.005), // عرض الإطار
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/Vector 3.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            buildLabeledTextField(context, widget.userName, "الاسم"),
            buildLabeledTextField(context, widget.email, "الايميل"),
            buildLabeledTextField(context, widget.phoneNumber, "رقم الهاتف"),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildLabeledTextField(
      BuildContext context, String initialValue, String labelText) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenWidth * 0.025,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "$labelText",
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: screenWidth * 0.02),
          Container(
            width: screenWidth,
            height: screenWidth * 0.12,
            child: TextField(
              enabled: false,
              controller: TextEditingController(text: initialValue),
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.right,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(50, 50, 50, 2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenWidth * 0.03,
                  horizontal: screenWidth * 0.02,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.02),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.white70,
                    size: screenWidth * 0.05,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.02)),
                  borderSide: BorderSide(color: KprimaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
