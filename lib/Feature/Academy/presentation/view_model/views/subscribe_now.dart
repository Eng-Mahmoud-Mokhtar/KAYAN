import 'package:flutter/material.dart';
import '../../../../core/utiles/constans.dart';
import 'widgets/UploudDetailsAcademy.dart';
import 'widgets/confirmationAcademy.dart';

class SubscribeAcademy extends StatelessWidget {
  final String AcademyName;
  final String price;
  final String imagePath;

  const SubscribeAcademy({
    required this.AcademyName,
    required this.price,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff302F2D),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_forward_sharp, color: Colors.white),
          ),
        ],
        title: Text(
          'اشترك الان ',
          style: TextStyle(color: Colors.white,            fontSize: screenWidth * 0.04,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.01),
            Container(
              height: screenWidth * 0.22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                gradient: const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFF283725),
                    Color(0xFF191C18),
                  ],
                ),
              ),
              child: Row(
                children: [
                  const Spacer(flex: 1),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AcademyName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.08,
                        backgroundImage: AssetImage(imagePath),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'السن',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 0.04,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Container(
                            height: screenWidth * 0.12,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(50, 50, 50, 2),
                                hintText: 'اكتب السن',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.035,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: KprimaryColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'الاسم',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 0.04,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Container(
                            height: screenWidth * 0.12,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(50, 50, 50, 2),
                                hintText: 'اكتب الاسم',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.035,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: KprimaryColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'العنوان',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: screenWidth * 0.12,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(50, 50, 50, 2),
                          hintText: 'العنوان',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.035,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: KprimaryColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            const UploudDetailsAcademy(text: 'رفع البطاقه الشخصيه '),
            SizedBox(height: screenHeight * 0.02),
            Container(
              width: screenWidth,
              height: screenWidth * 0.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: KprimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ConfirmationAcademy(),
                    ),
                  );
                },
                child: Text(
                  'تاكيد',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.04,
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
