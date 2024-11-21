import 'package:flutter/material.dart';
import '../../../../../../core/colors.dart';
import 'FavProductDetails.dart';

class FavProudect extends StatefulWidget {
  const FavProudect({Key? key}) : super(key: key);

  @override
  State<FavProudect> createState() => _FavProudectState();
}

class _FavProudectState extends State<FavProudect> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorManager.Black,
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
                    title: 'Nike',
                    urlImage: 'images/Rectangle 10981.png',
                    price: '250 \$',
                    discount: '20% خصم',
                    details: 'تفاصيل حول Nike',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'Adidas',
                    urlImage: 'images/Rectangle 10981 (5).png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'تفاصيل حول Adidas',
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
                    title: 'Nike',
                    urlImage: 'images/Rectangle 10981.png',
                    price: '250 \$',
                    discount: '20% خصم',
                    details: 'تفاصيل حول Nike',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'Adidas',
                    urlImage: 'images/Rectangle 10981.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'تفاصيل حول Adidas',
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
                    title: 'Nike',
                    urlImage: 'images/Rectangle 10981.png',
                    price: '250 \$',
                    discount: '20% خصم',
                    details: 'تفاصيل حول Nike',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'Adidas',
                    urlImage: 'images/Rectangle 10981.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'تفاصيل حول Adidas',
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
                    title: 'Nike',
                    urlImage: 'images/Rectangle 10981.png',
                    price: '250 \$',
                    discount: '20% خصم',
                    details: 'تفاصيل حول Nike',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'Adidas',
                    urlImage: 'images/Rectangle 10981.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'تفاصيل حول Adidas',
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
            builder: (context) => FavProductDetails(
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
