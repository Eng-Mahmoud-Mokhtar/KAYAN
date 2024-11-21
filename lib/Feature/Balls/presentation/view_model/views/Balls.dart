import 'package:flutter/material.dart';
import '../../../../../core/appbar_widget.dart';
import '../../../../../core/colors.dart';
import 'Balls_details.dart';

class Balls extends StatefulWidget {
  const Balls({Key? key}) : super(key: key);

  @override
  State<Balls> createState() => _BallsState();
}

class _BallsState extends State<Balls> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorManager.Black,
      appBar: appBarContent(
        title: "كره",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // 3% من العرض
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenWidth * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  containershops(
                    title: 'مولتن',
                    urlImage: 'images/academy/Screenshot 2024-09-22 001244.png',
                    price: '250 \$',
                    discount: '20% خصم',
                    details: 'كرة قدم مولتن',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'جولد دير',
                    urlImage: 'images/academy/Screenshot 2024-09-22 001233.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'كرة قدم من جولد دير',
                    availableColors: ['0xFF0000FF', '0xFFFFFF00'],
                    width: screenWidth * 0.45,
                    height: screenWidth * 0.55,
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  containershops(
                    title: 'اسبورت',
                    urlImage: 'images/academy/Screenshot 2024-09-22 001210.png',
                    price: '250 \$',
                    discount: '20% خصم',
                    details: 'كرة قدم من اسبورت',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'جولد',
                    urlImage: 'images/academy/Screenshot 2024-09-22 001157.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'كرة قدم جولد مستورده ',
                    availableColors: ['0xFF0000FF', '0xFFFFFF00'],
                    width: screenWidth * 0.45,
                    height: screenWidth * 0.55,
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  containershops(
                    title: 'جوك',
                    urlImage: 'images/academy/Screenshot 2024-09-22 001139.png',
                    price: '250 \$',
                    discount: '20% خصم',
                    details: 'كرة قدم جوك',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'كره مكسه',
                    urlImage: 'images/academy/Screenshot 2024-09-22 001132.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'كره مكسه استيراد',
                    availableColors: ['0xFF0000FF', '0xFFFFFF00'],
                    width: screenWidth * 0.45,
                    height: screenWidth * 0.55,
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  containershops(
                    title: 'مولتن',
                    urlImage: 'images/academy/Screenshot 2024-09-22 001244.png',
                    price: '250 \$',
                    discount: '20% خصم',
                    details: 'كرة قدم مولتن',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'جولد دير',
                    urlImage: 'images/academy/Screenshot 2024-09-22 001233.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'كرة قدم من جولد دير',
                    availableColors: ['0xFF0000FF', '0xFFFFFF00'],
                    width: screenWidth * 0.45,
                    height: screenWidth * 0.55,
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Widget containershops({
    required String title,
    required String urlImage,
    required String price,
    required String discount,
    required String details,
    required List<String> availableColors,
    required double width,
    required double height,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BallsDetails(
              title: title,
              urlImage: urlImage,
              price: price,
              details: details,
            ),
          ),
        );
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(239, 239, 239, 0.6),
              Color.fromRGBO(255, 255, 255, 0.08),
            ],
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  urlImage,
                  fit: BoxFit.fitWidth,
                  height: height * 0.6,
                  width: double.infinity,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w400,
                    fontSize: width *0.1,
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.1,
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Positioned(
              top: height * 0.3,
              right: 0,
              child: Container(
                color: Colors.red,
                child: Text(
                  discount,
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontSize: width * 0.080,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
