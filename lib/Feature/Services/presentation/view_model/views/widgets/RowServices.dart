import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'BuildContainerService.dart';

Widget buildRow(BuildContext context, List<Map<String, dynamic>> services) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: services.map((service) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: containerService(
          context: context,
          title: service['title'],
          urlImage: service['urlImage'],
          onTap: () {
            if (service['page'] != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => service['page']),
              );
            }
          },
        ),
      );
    }).toList(),
  );
}
