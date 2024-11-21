import 'package:flutter/material.dart';
import 'widgets/implementationItem.dart';

class UnderImplementation extends StatelessWidget {
  const UnderImplementation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: ImplementationItem(),
      ),
    );
  }
}
