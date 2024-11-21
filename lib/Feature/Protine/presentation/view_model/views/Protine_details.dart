import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/appbar_widget.dart';
import '../../../../core/utiles/constans.dart';

class ProtineDetails extends StatefulWidget {
  final String title;
  final String urlImage;
  final String price;
  final String details;

  ProtineDetails({
    required this.title,
    required this.urlImage,
    required this.price,
    required this.details,
  });

  @override
  _ProtineDetailsState createState() => _ProtineDetailsState();
}

class _ProtineDetailsState extends State<ProtineDetails> {

  final List<String> availableFlavors = ['فراولة', 'فانيليا', 'شيكولاته'];
  final List<String> sizes = ['40', '41', '42', '43', '44', '45'];
  String? selectedSize;
  String? selectedFlavor;
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
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'الأطعمة المتاحة',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: availableFlavors.map((flavor) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFlavor = flavor;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: screenWidth * 0.02),
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: selectedFlavor == flavor ? KprimaryColor : Colors.grey[800],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                flavor,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04,
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
              SizedBox(height: screenHeight * 0.01),
              Text(
                'الكمية',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 40, // جعل العرض أكبر لتحسين التناسق
                    height: 40, // جعل الارتفاع أكبر
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(Icons.remove, color: KprimaryColor, size: screenWidth * 0.05),
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
                      style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(Icons.add, color: KprimaryColor, size: screenWidth * 0.05),
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
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.price,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
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
