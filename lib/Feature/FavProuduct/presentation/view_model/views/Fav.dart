import 'package:flutter/material.dart';
import 'package:homepage/Feature/FavProuduct/presentation/view_model/views/widgets/FavProudect.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import 'Reals.dart';


class Fav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(48, 47, 45, 1),
          title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Center(
              child: Text(
                'المفضلة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
          automaticallyImplyLeading: false,
          bottom: TabBar(
            labelColor: KprimaryColor,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  'مقاطع الريلز',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'المنتجات',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Reals(),
            FavProudect(),
          ],
        ),
      ),
    );
  }
}
