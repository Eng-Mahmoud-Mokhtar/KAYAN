import 'package:flutter/material.dart';
import 'package:homepage/Feature/SportsShose/presentation/view_model/views/product_details.dart';
import '../../../../../../core/appbar_widget.dart';
import '../../../../../../core/colors.dart';
import '../../../../../../core/spaces.dart';

class HandMScreen extends StatefulWidget {
  const HandMScreen({Key? key}) : super(key: key);

  @override
  State<HandMScreen> createState() => _HandMScreenState();
}

class _HandMScreenState extends State<HandMScreen> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.Black,
      appBar: appBarContent(title: "منتجات H&M", onTap: () { Navigator.pop(context);} ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  containerChose(
                    title: "حذاء رياضي",
                    urlImage: "images/Rectangle 10981.png",
                    price: "50",
                    discount: "",
                    details: "تفاصيل المنتج",
                    availableColors: ["أحمر", "أزرق"],
                  ),
                  spacWidth(25),
                  containerChose(
                    title: "حذاء رياضي",
                    urlImage: "images/Rectangle 10981.png",
                    price: "60",
                    discount: "",
                    details: "تفاصيل المنتج",
                    availableColors: ["أخضر", "أبيض"],
                  ),
                ],
              ),
              SizedBox(height: 25),
              // More rows can follow as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget containerChose({
    required String title,
    required String urlImage,
    required String price,
    required String discount,
    required String details,
    required List<String> availableColors,
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
        width: 164.0,
        height: 215.0,
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
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  urlImage,
                  fit: BoxFit.fitWidth,
                  height: 126,
                ),
                Positioned(
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.3),
                    child: Center(
                      child: IconButton(
                        iconSize: 16,
                        color: Colors.green,
                        onPressed: () {
                          setState(() {
                            isPressed = !isPressed;
                          });
                        },
                        icon: Icon(
                          isPressed ? Icons.bookmark : Icons.bookmark_border,
                        ),
                      ),
                    ),
                  ),
                  top: 13,
                  left: 15,
                ),
              ],
            ),
            spacHeight(10),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Almarai',
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                height: 31.0 / 16.0,
                letterSpacing: -0.41,
                color: Color.fromRGBO(255, 255, 255, 0.7),
              ),
              textAlign: TextAlign.right,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'جنية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
