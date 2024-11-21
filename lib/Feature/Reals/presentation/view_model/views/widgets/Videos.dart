import 'package:flutter/material.dart';

class Videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Image.asset(
                "assets/images/Video.png", // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 490,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end, // تعديل هنا
                    children: [
                      Text(
                        "Name of person",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 26,
                        width: 56,
                        padding: EdgeInsets.all(0), // تعديل هنا
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.17),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color.fromRGBO(82, 194, 52, 1),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "متابعة",
                            style: TextStyle(
                              color: Color.fromRGBO(82, 194, 52, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10), // تعديل هنا
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("assets/images/VidProfile.png"), // Replace with your image path
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 350,top: 310),
              child: Column(
                children: [
                  Icon(Icons.favorite_sharp,color: Colors.white,size: 30),
                  SizedBox(height: 10),
                  Text('6623',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/images/comment.png',
                    color: Colors.white,
                    width: 50,
                    height: 50,
                  ),
                  Text('50',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Image.asset(
                    'assets/images/share.png',
                    color: Colors.white,
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/saveVid.png',
                    color: Color.fromRGBO(82, 194, 52, 1),
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
