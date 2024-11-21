import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/Store/presentation/view_model/views/AllStore.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import '../../../../../Chats/presentation/view_model/views/chatsHome.dart';
import '../../../../../Challenges/presentation/view_model/views/Challenges.dart';
import '../../../../../Profile/presentation/view_model/views/my_account.dart';
import '../../../../../Purchases/presentation/view_model/views/Purchases.dart';
import '../../../../../Reals/presentation/view_model/views/widgets/Videos.dart';
import '../home.dart';

class BottomHome extends StatefulWidget {
  @override
  _BottomHomeState createState() => _BottomHomeState();
}
class _BottomHomeState extends State<BottomHome> {
  int _currentIndex = 5;

  List<Widget> _pages = [
    Purchases(),
    AllStore(),
    Videos(),
    MyAccount(),
    Chat(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: KprimaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Play()),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Image.asset(
          'assets/images/new.png',
          height: screenHeight * 0.05,
          width: screenWidth * 0.05,
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomAppBar(
        height: screenHeight * 0.1,
        notchMargin: screenHeight * 0.017,
        shape: const CircularNotchedRectangle(),
        color: const Color.fromRGBO(48, 47, 45, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Container(
                    width: screenWidth * 0.04,
                    height: screenWidth * 0.04,
                    child: Image.asset(
                      'assets/images/user1.png',
                      fit: BoxFit.contain,
                      color: _currentIndex == 3
                          ? KprimaryColor
                          : const Color.fromRGBO(103, 104, 109, 1),
                    ),
                  ),
                  onPressed: () {
                    _onItemTapped(3);
                  },
                ),
                IconButton(
                  icon: Container(
                    width: screenWidth * 0.04,
                    height: screenWidth * 0.04,
                    child: Image.asset(
                      'assets/images/cam.png',
                      fit: BoxFit.contain,
                      color: _currentIndex == 2
                          ? KprimaryColor
                          : const Color.fromRGBO(103, 104, 109, 1),
                    ),
                  ),
                  onPressed: () {
                    _onItemTapped(2);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.store,
                    size: 17.sp,
                    color: _currentIndex == 1
                        ? KprimaryColor
                        : const Color.fromRGBO(103, 104, 109, 1),
                  ),
                  onPressed: () {
                    _onItemTapped(1);
                  },
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart_rounded,
                    size: 17.sp,
                    color: _currentIndex == 0
                        ? KprimaryColor
                        : const Color.fromRGBO(103, 104, 109, 1),
                  ),
                  onPressed: () {
                    _onItemTapped(0);
                  },
                ),
                IconButton(
                  icon: Container(
                    width: screenWidth * 0.04,
                    height: screenWidth * 0.04,
                    child: Image.asset(
                      'assets/images/Group.png',
                      fit: BoxFit.contain,
                      color: _currentIndex == 4
                          ? KprimaryColor
                          : const Color.fromRGBO(103, 104, 109, 1),
                    ),
                  ),
                  onPressed: () {
                    _onItemTapped(4);
                  },
                ),
                IconButton(
                  icon: Container(
                    width: screenWidth * 0.04,
                    height: screenWidth * 0.04,
                    child: Image.asset(
                      'assets/images/Home (1).png',
                      fit: BoxFit.contain,
                      color: _currentIndex == 5
                          ? KprimaryColor
                          : const Color.fromRGBO(103, 104, 109, 1),
                    ),
                  ),
                  onPressed: () {
                    _onItemTapped(5);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}


