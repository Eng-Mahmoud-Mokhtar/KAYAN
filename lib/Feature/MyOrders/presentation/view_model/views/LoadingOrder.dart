import 'package:flutter/material.dart';

import 'widgets/Items.dart';

class ReadyOrder extends StatelessWidget {
  const ReadyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Items(),
      ),
    );
  }
}
