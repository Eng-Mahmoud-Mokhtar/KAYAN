import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploudDetailsNearby extends StatefulWidget {
  final String text;
  final Image? image;

  const UploudDetailsNearby({
    super.key,
    required this.text,
    this.image,
  });

  @override
  State<UploudDetailsNearby> createState() => _UploudDetailsNearbyState();
}

class _UploudDetailsNearbyState extends State<UploudDetailsNearby> {
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    final containerWidth = screenWidth * 0.9;
    final containerHeight = _selectedImage == null
        ? containerWidth / 3
        : containerWidth;

    final textSize = screenWidth * 0.04;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: textSize,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(source: ImageSource.gallery);

            if (image != null) {
              setState(() {
                _selectedImage = image;
              });
            }
          },
          child: Container(
            width: containerWidth,
            height: containerHeight,
            child: DottedBorder(
              borderType: BorderType.RRect,
              strokeWidth: 1.0,
              color: Colors.white24,
              dashPattern: const [10, 10],
              radius: const Radius.circular(8),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0x1c302f2d),
                ),
                child: Center(
                  child: _selectedImage != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(_selectedImage!.path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/upload.png'),
                      Text(
                        'اضغط هنا لاضافة الصورة ',
                        style: TextStyle(
                          color: Colors.white24,
                          fontSize: textSize * 0.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
