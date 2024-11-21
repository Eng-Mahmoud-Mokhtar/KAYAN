import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/appbar_widget.dart';
import '../../../../core/utiles/constans.dart';
import 'widgets/Detailes.dart';
import 'widgets/SendSuccessfully.dart';

class Callus extends StatelessWidget {
  const Callus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    XFile? _selectedImage;
    TextEditingController complaintController = TextEditingController(); // متحكم النص
    return Scaffold(
      appBar: appBarContent(
        title: "اتصل بنا",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'الايميل',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(50, 50, 50, 2),
                      hintText: 'اكتب الايميل الخاص بك',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 5),
                        child: Icon(
                          Icons.email_outlined,
                          color: Colors.white70,
                          size: 27,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: KprimaryColor),
                      ),
                    ),
                  ),
                ),
              ),
              DetailsCallus(
                text: 'ارفق صوره الشكوي',
                image: _selectedImage != null ? Image.file(File(_selectedImage!.path)) : null, // عرض الصورة المختارة
              ),
              SizedBox(height: 20),
              Text(
                'اكتب سبب الشكوي',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: screenWidth,
                height: screenWidth * 0.4, // ارتفاع ثابت يتناسب مع عرض الشاشة
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(50, 50, 50, 2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: KprimaryColor),
                ),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: TextField(
                      controller: complaintController,
                      maxLines: null, // للسماح بعدد غير محدود من الأسطر
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none, // إخفاء الإطار الافتراضي
                        hintText: 'اكتب',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                    _SendSuccessfully(context);
                  },
                  child: Text(
                    'ارسال',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
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

  void _SendSuccessfully(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SendSuccessfully(),
        );
      },
    );
  }
}
