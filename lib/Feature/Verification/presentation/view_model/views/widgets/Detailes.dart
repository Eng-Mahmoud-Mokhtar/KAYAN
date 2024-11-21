import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utiles/constans.dart';
import 'UploudDetailsVerification.dart';
import 'confirmation.dart';

class DetailesVerifi extends StatefulWidget {
  const DetailesVerifi({super.key});
  @override
  State<DetailesVerifi> createState() => _DetailesVerifiState();
}

class _DetailesVerifiState extends State<DetailesVerifi> {
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_forward_sharp, color: Colors.white),
          ),
        ],
        backgroundColor: const Color(0xff302F2D),
        title: const Text(
          'طلب التوثيق',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'الاسم بالكامل',
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
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(50, 50, 50, 2),
                    hintText: 'اكتب الاسم',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.035,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
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
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: KprimaryColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'رقم الهاتف',
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
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(50, 50, 50, 2),
                    hintText: 'اكتب الرقم',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.035,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.02),
                      child: Icon(
                        Icons.phone_enabled_outlined,
                        color: Colors.white70,
                        size: screenWidth * 0.05,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: KprimaryColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'اختيار مدة الاشتراك',
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
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'مدة الاشتراك',
                    filled: true,
                    fillColor: Color.fromRGBO(50, 50, 50, 2),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.035,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.02),
                      child: Icon(
                        Icons.calendar_view_month,
                        color: Colors.white70,
                        size: screenWidth * 0.05,
                      ),
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
                          value: 'شهر',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                ' شهر ',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'ثلاث اشهر',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                ' ثلاث اشهر ',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'سنه',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'سنه',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: KprimaryColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              UploudDetailsVerification(
                text: 'صورة البطاقة الشخصية',
                image: _selectedImage != null
                    ? Image.file(File(_selectedImage!.path))
                    : null,
              ),
              SizedBox(height: screenHeight * 0.03),
        
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KprimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ConfirmationVerification(),
                      ),
                    );
                  },
                  child: Text(
                    'إرسال الطلب ',
                    style: TextStyle(
                      color: Colors.white,
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
