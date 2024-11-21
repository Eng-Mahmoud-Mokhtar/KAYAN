import 'package:flutter/material.dart';
import 'widgets/CanceledItems.dart';

class Canceled extends StatelessWidget {
  const Canceled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: CanceledItem(),
      ),
    );
  }
}
