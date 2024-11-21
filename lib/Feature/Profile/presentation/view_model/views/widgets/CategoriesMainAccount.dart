import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/ChangePassword/presentation/view_model/views/ChangePass.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import '../../../../../Call/presentation/view_model/views/callus.dart';
import '../../../../../FavProuduct/presentation/view_model/views/Fav.dart';
import '../../../../../Location/presentation/view_model/views/LocationScreen.dart';
import '../../../../../MyOrders/presentation/view_model/views/OrderHome.dart';
import '../../../../../Points/presentation/view_model/views/widgets/Points.dart';
import '../../../../../Condition/presentation/view_model/views/widgets/Conditions_terms.dart';
import '../../../../../PrivacePolicie/presentation/view_model/views/widgets/PrivacyPolicy.dart';
import '../../../../../LogOut/presentation/view_model/views/widgets/logOut.dart';
import '../../../../../Questiona/presentation/view_model/views/widgets/questions _screen.dart';
import '../../../../../ShareWith/presentation/view_model/views/widgets/shareWithFrindes.dart';
import '../../../../../Verification/presentation/view_model/views/AccountVervification.dart';
Widget buildOrderContainer(Map<String, dynamic> order, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (order['name'] == 'طلباتك') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OrderHome(),
        ));
      } else if (order['name'] == 'مفضل') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Fav(),
        ));
      } else if (order['name'] == 'عنونك') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LocationScreen(),
        ));
      } else if (order['name'] == 'ادعوا أصدقائك') {
        ShareBottomSheet().show(context);
      } else if (order['name'] == 'النقاط') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Points(),
        ));
      } else if (order['name'] == 'غير كلمة السر') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChangePassword(),
        ));
      } else if (order['name'] == 'توثيق الحساب') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AccountVerification(),
        ));
      } else if (order['name'] == 'اتصل بنا') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Callus(),
        ));
      }else if (order['name'] == 'أسئلة وأجوبة') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Questions(),
        ));
      } else if (order['name'] == 'البنود والظروف') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Conditions(),
        ));
      }else if (order['name'] == 'سياسة الخصوصية') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PrivacyPolicy(),
        ));
      } else if (order['name'] == 'تسجيل الخروج') {
        LogoutAlertDialog().deploy(context);
      } else {}
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(42, 40, 41, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_back_ios_new_rounded,
                color: KprimaryColor,
                size: 18,
              ),
              Spacer(),
              Text(
                order['name'],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              Image(image: AssetImage(order['image'])),
            ],
          ),
        ),
      ),
    ),
  );
}
