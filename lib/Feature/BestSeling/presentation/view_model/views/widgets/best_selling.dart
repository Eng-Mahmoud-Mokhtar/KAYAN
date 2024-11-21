import 'package:flutter/material.dart';
import '../../../../../../core/appbar_widget.dart';
import '../../../../../../core/colors.dart';
import '../../../../../../core/spaces.dart';

class BestSelling extends StatefulWidget {
  const BestSelling({Key? key}) : super(key: key);

  @override
  State<BestSelling> createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(      backgroundColor: ColorManager.Black,

      appBar: appBarContent(title: "المنتجات الاكثر مبيعا", onTap: (){
        Navigator.pop(context);

      }),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  containershops(title: 'H&M', urlImage: 'images/Rectangle 10981.png'),
                  spacWidth(30),
                  containershops(title: 'H&M', urlImage: 'images/Rectangle 10981.png'),

                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  containershops(title: 'H&M', urlImage: 'images/Rectangle 10981.png'),
                  spacWidth(30),
                  containershops(title: 'H&M', urlImage: 'images/Rectangle 10981.png'),

                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  containershops(title: 'H&M', urlImage: 'images/Rectangle 10981.png'),
                  spacWidth(30),
                  containershops(title: 'H&M', urlImage: 'images/Rectangle 10981.png'),

                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  containershops(title: 'H&M', urlImage: 'images/Rectangle 10981.png'),
                  spacWidth(30),
                  containershops(title: 'H&M', urlImage: 'images/Rectangle 10981.png'),

                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  containershops(title: 'H&M', urlImage: 'images/Group 1000004120.png'),
                  spacWidth(30),
                  containershops(title: 'Polo', urlImage: 'images/Group 1000004120(1).png'),

                ],
              ),

            ],
          ),
        ),
      ),

    );
  }
  Widget containershops({required String title,required String urlImage}) {
    return InkWell(onTap: (){


    },
      child: Container(
        width: 164.0,
        height: 211.0,
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

            Image.asset(
              urlImage,
              fit: BoxFit.fitWidth,
              height: 126,
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

          ],
        ),
      ),
    );
  }

}
