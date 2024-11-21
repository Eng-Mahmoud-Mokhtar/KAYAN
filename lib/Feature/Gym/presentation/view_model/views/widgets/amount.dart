import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homepage/Feature/Gym/presentation/view_model/views/widgets/Button.dart';
import 'package:image_picker/image_picker.dart';
import 'Wait_message.dart';
import 'UploudDetailsGym.dart';


class AttachTransferGym extends StatefulWidget {
  const AttachTransferGym({super.key});
  @override
  State<AttachTransferGym> createState() => _AttachTransferGymState();
}

class _AttachTransferGymState extends State<AttachTransferGym> {
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
        title: Text(
          'ارفاق تحويل المبلغ',
          style: TextStyle(color: Colors.white,fontSize: screenWidth * 0.04),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          children: [
            UploudDetailsGym(
              text: 'قم بارفاق صورة تحويل المبلغ',
              image: _selectedImage != null ? Image.file(File(_selectedImage!.path)) : null, // عرض الصورة المختارة
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            ButtomGym(
              buttomtext: 'تاكيد',
              width: double.infinity,
              onPressed: () {
                _ChangedSuccessfully(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _ChangedSuccessfully(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: ChangedSuccessfully(),
        );
      },
    );
  }
}
