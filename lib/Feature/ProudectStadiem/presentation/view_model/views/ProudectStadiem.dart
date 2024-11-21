import 'package:flutter/material.dart';
import '../../../../../core/appbar_widget.dart';
import '../../../../../core/colors.dart';
import 'ProudectStadiem_details.dart';

class ProudectStadiem extends StatefulWidget {
  const ProudectStadiem({Key? key}) : super(key: key);

  @override
  State<ProudectStadiem> createState() => _ProudectStadiemState();
}

class _ProudectStadiemState extends State<ProudectStadiem> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorManager.Black,
      appBar: appBarContent(
        title: "تجهيز ملاعب",
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
                    title: 'قمع تدريب ملاعب',
                    urlImage: 'images/Store/Screenshot 2024-09-22 002700.png',
                    price: '250 \$',
                    discount: '20% خصم',
                    details: ' أداة تُستخدم لتوجيه اللاعبين والفرق في عملية التدريب بشكل منظم وفعّال',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'كشاف ليد',
                    urlImage: 'images/Store/Screenshot 2024-09-22 002944.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'كشاف ليد 100 وات 150وات 200 وات 400 وات  يستخدم فى الملاعب',
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
                    title: 'نجيل صناعي',
                    urlImage: 'images/Store/Screenshot 2024-09-22 003148.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'نجيل صناعي مصري خاص بالملاعب بكثافة عالية وضمان 8 سنوات معتمد من فيفا. يتميز النجيل الصناعي بثبات اللون والشكل دون الحاجة إلى رعايته.',
                    availableColors: ['0xFF0000FF', '0xFFFFFF00'],
                    width: screenWidth * 0.45,
                    height: screenWidth * 0.55,
                  ),
                  containershops(
                    title: 'سور ملاعب',
                    urlImage: 'images/Store/Screenshot 2024-09-22 003835.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'سور ملاعب للحفاظ علي الكره من الخروج بعيدا',
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
                    title: 'قمع تدريب ملاعب',
                    urlImage: 'images/Store/Screenshot 2024-09-22 002700.png',
                    price: '250 \$',
                    discount: '20% خصم',
                    details: ' أداة تُستخدم لتوجيه اللاعبين والفرق في عملية التدريب بشكل منظم وفعّال',
                    availableColors: ['0xFF000000', '0xFFFFFFFF'],
                    width: screenWidth * 0.45, // 40% من العرض
                    height: screenWidth * 0.55, // 55% من العرض
                  ),
                  containershops(
                    title: 'كشاف ليد',
                    urlImage: 'images/Store/Screenshot 2024-09-22 002944.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'كشاف ليد 100 وات 150وات 200 وات 400 وات  يستخدم فى الملاعب',
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
                    title: 'نجيل صناعي',
                    urlImage: 'images/Store/Screenshot 2024-09-22 003148.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'نجيل صناعي مصري خاص بالملاعب بكثافة عالية وضمان 8 سنوات معتمد من فيفا. يتميز النجيل الصناعي بثبات اللون والشكل دون الحاجة إلى رعايته.',
                    availableColors: ['0xFF0000FF', '0xFFFFFF00'],
                    width: screenWidth * 0.45,
                    height: screenWidth * 0.55,
                  ),
                  containershops(
                    title: 'سور ملاعب',
                    urlImage: 'images/Store/Screenshot 2024-09-22 003835.png',
                    price: '300 \$',
                    discount: '15% خصم',
                    details: 'سور ملاعب للحفاظ علي الكره من الخروج بعيدا',
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
            builder: (context) => ProductDetails(
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
