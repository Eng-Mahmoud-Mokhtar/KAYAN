import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utiles/constans.dart';

class Birthday extends StatefulWidget {
  const Birthday({super.key});

  @override
  State<Birthday> createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday> {
  final TextEditingController _dobController = TextEditingController();
  bool _isDobValid = false;
  @override
  void dispose() {
    _dobController.dispose();
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
                'تاريخ الميلاد',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            openDatePicker(context);
          },
          child: AbsorbPointer(  // Prevents keyboard from appearing
            child: Container(
              width: screenWidth,
              height: screenWidth * 0.12,
              child: TextField(
                controller: _dobController,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(50, 50, 50, 2),
                  hintText: 'اكتب تاريخ الميلاد',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: screenWidth * 0.035,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.02),
                    child: Icon(
                      Icons.calendar_today,
                      color: KprimaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: KprimaryColor,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _isDobValid = value.isNotEmpty;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  void openDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: KprimaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
        _isDobValid = true;
      });
    }
  }
}
