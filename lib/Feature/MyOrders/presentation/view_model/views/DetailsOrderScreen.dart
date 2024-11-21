import 'package:flutter/material.dart';
import 'package:homepage/Feature/MyOrders/presentation/view_model/views/tracking.dart';

import '../../../../../core/appbar_widget.dart';

class TrackingOrder extends StatelessWidget {
  const TrackingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarContent(
        title: "تتبع الاوردر",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Tracking(),
          ],
        ),
      ),
    );
  }
}
