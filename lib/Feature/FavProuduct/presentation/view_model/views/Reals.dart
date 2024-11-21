import 'package:flutter/material.dart';
import 'widgets/WidgetReals.dart';

class Reals extends StatelessWidget {
  const Reals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column
          (children:[
        WidgetReals(),
          WidgetReals(),
          WidgetReals(),
        ]),
      ),
    );
  }
}
