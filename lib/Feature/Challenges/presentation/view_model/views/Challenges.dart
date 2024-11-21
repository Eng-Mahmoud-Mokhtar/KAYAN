import 'package:flutter/material.dart';
import 'package:homepage/Feature/Challenges/presentation/view_model/views/widgets/buildChallengesContainer.dart';
import 'package:homepage/Feature/Challenges/presentation/view_model/views/widgets/buildInfoContainer.dart';
import 'package:homepage/Feature/Challenges/presentation/view_model/views/widgets/buildSharedContainer.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import 'widgets/column1.dart';
import 'widgets/column2.dart';
import '../../../../../core/colors.dart';

class Play extends StatefulWidget {
  const Play({Key? key}) : super(key: key);

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  bool showInfo = false;
  bool showChallenges = false;
  bool showPosts = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: ColorManager.appBarColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          'التحديات',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.04,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            children: [
              Column1(context),
              Column2(context),
              SizedBox(height: screenHeight * 0.04),
              SafeArea(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.025),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(85, 85, 85, 2.0),
                            Color.fromRGBO(40, 40, 40, 1),
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: screenWidth * 0.15),
                          Padding( // إضافة Padding هنا
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                            child: Column(
                              children: [
                                if (showInfo) buildInfoContainer(context),
                                if (showChallenges) buildChallengesContainer(context),
                                if (showPosts) SharedContainer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.01,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildTab(
                              context,
                              screenHeight: screenHeight,
                              label: 'التحديات',
                              isSelected: showChallenges,
                              onTap: () {
                                setState(() {
                                  showInfo = false;
                                  showChallenges = true;
                                  showPosts = false;
                                });
                              },
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            buildTab(
                              context,
                              screenHeight: screenHeight,
                              label: 'المشاركات',
                              isSelected: showPosts,
                              onTap: () {
                                setState(() {
                                  showInfo = false;
                                  showChallenges = false;
                                  showPosts = true;
                                });
                              },
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            buildTab(
                              context,
                              screenHeight: screenHeight,
                              label: 'المعلومات',
                              isSelected: showInfo,
                              onTap: () {
                                setState(() {
                                  showInfo = true;
                                  showChallenges = false;
                                  showPosts = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTab(BuildContext context, {required String label, required bool isSelected, required double screenHeight, required Function() onTap}) {
    var screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenWidth * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? KprimaryColor : Colors.transparent,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.02),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.04,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
