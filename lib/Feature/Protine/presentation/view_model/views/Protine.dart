import 'package:flutter/material.dart';
import '../../../../../core/appbar_widget.dart';
import '../../../../../core/colors.dart';
import 'Protine_details.dart';

class Protine extends StatefulWidget {
  const Protine({Key? key}) : super(key: key);

  @override
  State<Protine> createState() => _ProtineState();
}

class _ProtineState extends State<Protine> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorManager.Black,
      appBar: appBarContent(
        title: "مكملات غذائية",
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
                    title: 'WhyProtine',
                    urlImage: 'images/academy/Screenshot 2024-09-21 233813.png',
                    price: '3500 \$',
                    discount: '20% خصم',
                    details: 'مكمل غذائي عالي البروتين كل 100 جرام 20 جرام بروتين',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'IsoProtine',
                    urlImage: 'images/academy/Screenshot 2024-09-21 233823.png',
                    price: '2700 \$',
                    discount: '15% خصم',
                    details: 'مكمل غذائي عالي البروتين خالي من الدهون ',
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
                    title: 'Biscutes',
                    urlImage: 'images/academy/Screenshot 2024-09-21 233828.png',
                    price: '250 \$',
                    discount: '20% خصم',
                    details: 'بسكوت غني بالبروتين',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'ISOADD',
                    urlImage: 'images/academy/Screenshot 2024-09-21 233835.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'مكمل غذائي عالي البروتين خالي من الدهون حجم صغير ',
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
                    title: 'WhyProtine',
                    urlImage: 'images/academy/Screenshot 2024-09-21 233844.png',
                    price: '1500 \$',
                    discount: '20% خصم',
                    details: 'مكمل غذائي عالي البروتين كل 100 جرام 20 جرام بروتين',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'Creatine',
                    urlImage: 'images/academy/Screenshot 2024-09-21 233853.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'كرياتين 30 جرعه لزياده قدرة تحمل التمرين',
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
                    title: 'WhyProtine',
                    urlImage: 'images/academy/Screenshot 2024-09-21 233813.png',
                    price: '3500 \$',
                    discount: '20% خصم',
                    details: 'مكمل غذائي عالي البروتين كل 100 جرام 20 جرام بروتين',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'IsoProtine',
                    urlImage: 'images/academy/Screenshot 2024-09-21 233823.png',
                    price: '2700 \$',
                    discount: '15% خصم',
                    details: 'مكمل غذائي عالي البروتين خالي من الدهون ',
                    availableColors: ['0xFF0000FF', '0xFFFFFF00'],
                    width: screenWidth * 0.45,
                    height: screenWidth * 0.55,
                  ),
                ],
              ),
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
            builder: (context) => ProtineDetails(
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