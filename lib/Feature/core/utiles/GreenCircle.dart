import 'package:flutter/material.dart';

class GreenCircal extends StatelessWidget {
  const GreenCircal({
    super.key,
    required this.color
  });

  final Color color;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        padding: EdgeInsets.all(2),
        width: 25 ,height: 25 ,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white60,
          ),

        ),
        child: DecoratedBox(decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:color ,
        ),),
      ),
    );
  }
}
