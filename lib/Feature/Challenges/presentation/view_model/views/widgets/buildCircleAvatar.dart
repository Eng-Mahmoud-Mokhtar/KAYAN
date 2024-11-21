import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCircleAvatarWithImage(String imagePath) {
  return CircleAvatar(
    backgroundColor: Color.fromRGBO(85, 85, 85, 2),
    radius: 20.0,
    child: Image.asset(
      imagePath,
      height: 25,
      fit: BoxFit.fill,
    ),
  );
}
