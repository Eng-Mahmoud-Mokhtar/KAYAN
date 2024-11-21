import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/appbar_widget.dart';
import '../../../../core/utiles/constans.dart';

class BagsDetails extends StatefulWidget {
  final String title;
  final String urlImage;
  final String price;
  final String details;

  BagsDetails({
    required this.title,
    required this.urlImage,
    required this.price,
    required this.details,
  });

  @override
  _BagsDetailsState createState() => _BagsDetailsState();
}

class _BagsDetailsState extends State<BagsDetails> {

  final List<String> availableColors = [
    '0xFFFF0000',
    '0xFF808080',
    '0xFFFFFFFF',
    '0xFF0000FF',
  ];
  final List<String> sizes = [ '40', '41', '42', '43', '44', '45'];
  String? selectedSize;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarContent(
        title: widget.title,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenWidth * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(widget.urlImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                widget.details,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.right,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'الألوان المتاحة',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01), // إضافة مسافة بين النص والألوان
                      Row(
                        children: availableColors.map((color) {
                          return GestureDetector(
                            onTap: () {
                              // هنا يمكنك إضافة منطق لتحديد اللون المحدد
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: screenWidth * 0.02), // مسافة بين الألوان
                              width: screenWidth * 0.075,
                              height: screenWidth * 0.075,
                              decoration: BoxDecoration(
                                color: Color(int.parse(color)),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'الكمية',
                    style: TextStyle(color: Colors.white,fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius:BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.remove,color: KprimaryColor,size: screenWidth * 0.04),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '$quantity',
                          style: TextStyle(color: Colors.white,fontSize: screenWidth * 0.04),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius:BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.add,color: KprimaryColor,size: screenWidth * 0.04),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'المقاسات',
                    style: TextStyle(color: Colors.white,fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: sizes.map((size) {
                        bool isSelected = size == selectedSize;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: screenWidth * 0.02),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: isSelected ? KprimaryColor : Colors.grey[800],
                              borderRadius:BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                size,
                                style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.03),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth * 0.75,
                    height: screenWidth * 0.12,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: KprimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // هنا يمكنك إضافة منطق لإضافة المنتج إلى السلة
                      },
                      child: Text(
                        'اضف الي السلة',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenWidth * 0.13,
                    child: Column(
                      children: [
                        Text(
                          'السعر',
                          style: TextStyle(
                            fontSize: screenWidth * 0.03, // 3% من العرض
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.price,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04, // 4% من العرض
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
