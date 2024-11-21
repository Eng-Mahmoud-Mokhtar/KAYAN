import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utiles/constans.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  final TextEditingController _genderController = TextEditingController();
  bool _isGenderValid = false;
  bool _formSubmitted = false;

  @override
  void dispose() {
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'النوع',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: screenWidth * 0.045,
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
            controller: _genderController,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.right,
            readOnly: true, // يجعل الحقل غير قابل للتحرير ويظهر السهم المنسدل
            decoration: InputDecoration(
              hintText: 'اختر النوع',
              filled: true,
              fillColor: Color.fromRGBO(50, 50, 50, 2),
              errorText: _formSubmitted && !_isGenderValid ? 'اختر النوع' : null,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: screenWidth * 0.035,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: PopupMenuButton<String>(
                icon: Icon(
                  Icons.arrow_drop_down_outlined,
                  size: screenWidth * 0.06,
                  color: Colors.grey.shade600,
                ),
                offset: Offset(0, screenWidth * 0.12), // تعديل الoffset لجعل القائمة المنبثقة تظهر بشكل صحيح
                color: Color.fromRGBO(51, 51, 51, 1),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'ذكر',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ' ذكر ',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.male_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'أنثى',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ' أنثى',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.female_sharp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
                onSelected: (String value) {
                  setState(() {
                    _genderController.text = value;
                    _isGenderValid = true;
                    _formSubmitted = true;
                  });
                },
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
