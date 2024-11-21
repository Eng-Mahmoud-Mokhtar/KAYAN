import 'package:flutter/material.dart';
import 'package:homepage/Feature/Profile/presentation/view_model/views/widgets/CategoriesMainAccount.dart';
import 'package:homepage/Feature/EditProfile/presentation/view_model/views/widgets/PrivteProfile.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import '../../../../../core/appbar_widget.dart';
import '../../../../Home/presentation/view_model/views/widgets/bottomBar.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final String _userName = 'Mahmoud';
  final String _email = 'Mahmoudmokhtar@gmail.com';
  final String _phoneNumber = '0123456789';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> ordersData = [
      {'name': 'طلباتك', 'image': 'assets/images/Account/Group 1000004359.png'},
      {'name': 'مفضل', 'image': 'assets/images/Account/Group 1000004359 (2).png'},
      {'name': 'عنونك', 'image': 'assets/images/Account/Group 1000004357.png'},
      {'name': 'ادعوا أصدقائك', 'image': 'assets/images/Account/Group 1000004357 (1).png'},
      {'name': 'النقاط', 'image': 'assets/images/Account/Group 1000004357 (2).png'},
      {'name': 'غير كلمة السر', 'image': 'assets/images/Account/Group 1000004357 (4).png'},
      {'name': 'توثيق الحساب', 'image': 'images/Service/Ellipse 509.png'},
      {'name': 'اتصل بنا', 'image': 'assets/images/Account/Group 1000004357 (5).png'},
      {'name': 'أسئلة وأجوبة', 'image': 'assets/images/Account/Group 1000004357 (6).png'},
      {'name': 'البنود والظروف', 'image': 'assets/images/Account/Group 1000004357 (7).png'},
      {'name': 'سياسة الخصوصية', 'image': 'assets/images/Account/Group 1000004357 (8).png'},
      {'name': 'تسجيل الخروج', 'image': 'assets/images/Account/Group 1000004357 (9).png'},
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarContent(
        title: "حسابى",
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomHome()),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyPrivateAccount(
                      userName: _userName,
                      email: _email,
                      phoneNumber: _phoneNumber,
                    ),
                  ),
                );
              },
              child: buildUserInfo(),
            ),
            buildOrdersList(ordersData, context),
          ],
        ),
      ),
    );
  }

  Widget buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _userName,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 150,
                child: Text(
                  _email.length > 25 ? _email.substring(0, 25) + '...' : _email,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: KprimaryColor, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/Vector 3.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildOrdersList(List<Map<String, dynamic>> ordersData, BuildContext context) {
    return ListView.builder(
      itemCount: ordersData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        Map<String, dynamic> order = ordersData[index];
        return buildOrderContainer(order, context);
      },
    );
  }
}

