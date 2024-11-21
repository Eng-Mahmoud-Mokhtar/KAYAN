import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';

class AddLocation extends StatefulWidget {
  final Function(String, String) onSave;

  AddLocation({required this.onSave});

  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 390,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(67, 71, 67, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 7, right: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.clear_sharp, color: Colors.white70, size: 20),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'اضافة عنوان ',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Divider(
                indent: 18,
                color: Color.fromRGBO(51, 51, 51, 0.84),
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'العنوان ',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 2, bottom: 20),
                child: Container(
                  height: 56,
                  child: TextField(
                    controller: _addressController,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(50, 50, 50, 2),
                      hintText: 'اكتب العنوان',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'رقم الموبايل ',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 2, bottom: 30),
                child: Container(
                  height: 56,
                  child: TextField(
                    controller: _phoneController,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(50, 50, 50, 2),
                      hintText: 'اكتب رقم الموبايل',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 2),
                child: Container(
                  width: 305,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KprimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // تمرير العنوان ورقم الموبايل إلى `onSave`
                      widget.onSave(_addressController.text, _phoneController.text);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'تم',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
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

