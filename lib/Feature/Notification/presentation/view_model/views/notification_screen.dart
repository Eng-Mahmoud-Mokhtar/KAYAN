import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/appbar_widget.dart';
import '../../../../../core/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorManager.Black,
      appBar: appBarContent(
        title: "الاشعارات",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNotificationItem(
              orderNumber: 'الطلب رقم 3117',
              message: 'طلبك قيد الإرسال وسيصل خلال 48 ساعة. شكرًا على صبرك!',
              screenWidth: screenWidth,
            ),
            Divider(color: Colors.grey.shade700),
            _buildNotificationItem(
              orderNumber: 'الطلب رقم 3118',
              message: 'تم شحن طلبك، وسيتوفر في أقرب وقت.',
              screenWidth: screenWidth,
            ),
            Divider(color: Colors.grey.shade700),
            _buildNotificationItem(
              orderNumber: 'الطلب رقم 3119',
              message: 'طلبك جاهز للاستلام. يمكنك زيارة المتجر.',
              screenWidth: screenWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({required String orderNumber, required String message, required double screenWidth}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                orderNumber,
                style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
              ),
              Text(
                message,
                style: TextStyle(color: Colors.white70, fontSize: screenWidth * 0.03),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.all(10),
          child: ClipOval(
            child: Image.asset(
              'images/svgexport-17 - 2023-10-12T230453.276 1.png',
              width: 35,
              height: 35,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
