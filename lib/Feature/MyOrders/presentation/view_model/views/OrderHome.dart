import 'package:flutter/material.dart';
import 'package:homepage/Feature/MyOrders/presentation/view_model/views/Canceled.dart';
import 'package:homepage/Feature/MyOrders/presentation/view_model/views/LoadingOrder.dart';
import 'package:homepage/Feature/MyOrders/presentation/view_model/views/Underimplementation.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';



class OrderHome extends StatelessWidget {
  const OrderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(48, 47, 45, 1),
          title: Text(
            'طلباتك',
            style: TextStyle(
              fontSize: screenWidth *0.04,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_outlined,color:Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor:KprimaryColor,
            labelColor: KprimaryColor,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  'تمت الالغاء',
                  style: TextStyle(fontSize: screenWidth *0.04,
                    fontWeight: FontWeight.w400,),
                ),
              ),
              Tab(
                child: Text(
                  'تحت التنفيذ',
                  style: TextStyle(fontSize: screenWidth *0.04,
                    fontWeight: FontWeight.w400,),
                ),
              ),
              Tab(
                child: Text(
                  'قيد التحضير',
                  style: TextStyle(fontSize: screenWidth *0.04,
                    fontWeight: FontWeight.w400,),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Canceled(),
            UnderImplementation(),
            ReadyOrder(),
          ],
        ),
      ),
    );
  }
}
