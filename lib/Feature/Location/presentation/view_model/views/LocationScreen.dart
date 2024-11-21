import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:homepage/Feature/Location/presentation/view_model/views/widgets/AddLocation.dart';
import 'package:homepage/Feature/Location/presentation/view_model/views/widgets/WidgetLocation.dart';
import '../../../../../core/appbar_widget.dart';
import '../../../../core/utiles/constans.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<Map<String, String>> locations = [];

  void _addNewLocation(String address, String phone) {
    setState(() {
      locations.add({'address': address, 'phone': phone});
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final containerWidth = screenWidth ;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarContent(
        title: "العنوان",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              ...locations.map((loc) {
                return WidgetLocation(address: loc['address']!, phone: loc['phone']!);
              }).toList(),

              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _showAddLocationDialog(context);
                },
                child: Container(
                  width: containerWidth,
                  height: screenWidth * 0.15,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    strokeWidth: 1.0,
                    color: KprimaryColor,
                    dashPattern: const [10, 10],
                    radius: const Radius.circular(8),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0x1c302f2d),
                      ),
                      child: Center(
                        child: Text(
                          'اضافه عنوان جديد',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize:screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showAddLocationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: AddLocation(onSave: _addNewLocation),
        );
      },
    );
  }
}



