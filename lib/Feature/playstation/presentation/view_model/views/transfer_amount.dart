import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Gym/presentation/view_model/views/widgets/Wait_message.dart';
import 'Widget/Button.dart';
import 'Widget/UploudDetailsStadium.dart';


class AttachTransferPlaystation extends StatefulWidget {
  const AttachTransferPlaystation({super.key});
  @override
  State<AttachTransferPlaystation> createState() => _AttachTransferPlaystationState();
}

class _AttachTransferPlaystationState extends State<AttachTransferPlaystation> {
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
            icon: Icon(Icons.arrow_forward_sharp, color: Colors.white),
          ),
        ],
        backgroundColor: const Color(0xff302F2D),
        title: Text(
          'ارفاق تحويل المبلغ',
          style: TextStyle(
              fontSize: screenWidth * 0.04
              ,color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          children: [
            UploudDetailsPlaystation(
              text: 'قم بارفاق صورة تحويل المبلغ',
              image: _selectedImage != null ? Image.file(File(_selectedImage!.path)) : null, // عرض الصورة المختارة
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            ButtomPlaystation(
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
