import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homepage/Feature/Academy/presentation/view_model/views/widgets/Button.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../Gym/presentation/view_model/views/widgets/Wait_message.dart';
import 'UploudDetailsVerification.dart';


class AttachTransferVerification extends StatefulWidget {
  const AttachTransferVerification({super.key});
  @override
  State<AttachTransferVerification> createState() => _AttachTransferVerificationState();
}

class _AttachTransferVerificationState extends State<AttachTransferVerification> {
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
          'ارفاق تحويل المبلغ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          children: [
            UploudDetailsVerification(
              text: 'قم بارفاق صورة تحويل المبلغ',
              image: _selectedImage != null ? Image.file(File(_selectedImage!.path)) : null, // عرض الصورة المختارة
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            ButtomAcademy(
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
