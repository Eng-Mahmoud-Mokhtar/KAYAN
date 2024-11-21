import 'package:flutter/material.dart';
import 'widgets/BodytRegister.dart';

class ResgisterPage extends StatelessWidget {
  const ResgisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image(
                    image: AssetImage('assets/FirstPages/Ellipse 508.png'),
                    width: screenWidth * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment(0, -0.6),
                    child: Image(
                      image: AssetImage('assets/FirstPages/Group 1000004348.png'),
                      width: screenWidth * 0.5,
                    ),
                  ),
                ),
              ],
            ),
            BodyRegister(),
                ],
        ),
      ),
    );
  }
}
