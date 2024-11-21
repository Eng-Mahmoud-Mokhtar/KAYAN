import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utiles/constans.dart';

class WidgetLocation extends StatefulWidget {
  String address; // جعل العنوان قابلاً للتعديل
  String phone; // جعل رقم الهاتف قابلاً للتعديل

  WidgetLocation({required this.address, required this.phone});

  @override
  _WidgetLocationState createState() => _WidgetLocationState();
}

class _WidgetLocationState extends State<WidgetLocation> {
  bool _isVisible = true;
  bool _isEditing = false;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController(text: widget.address);
    _phoneController = TextEditingController(text: widget.phone);
  }

  @override
  void dispose() {
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    setState(() {
      widget.address = _addressController.text;
      widget.phone = _phoneController.text;
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final containerWidth = screenWidth;

    return _isVisible
        ? Container(
          width: containerWidth,
          height: screenHeight * 0.20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromRGBO(36, 36, 36, 1),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (_isEditing) ...[
                            TextField(
                              controller: _addressController,
                              style: TextStyle(color: Colors.white70),
                              decoration: InputDecoration(
                                hintText: 'العنوان',
                                hintStyle: TextStyle(color: Colors.white54),
                              ),
                            ),
                            TextField(
                              controller: _phoneController,
                              style: TextStyle(color: Colors.white70),
                              decoration: InputDecoration(
                                hintText: 'رقم الهاتف',
                                hintStyle: TextStyle(color: Colors.white54),
                              ),
                            ),
                          ] else ...[
                            Text(
                              'العنوان - ${widget.address}',
                              style: TextStyle(color: Colors.white70),
                            ),
                            Text(
                              'رقم الهاتف - ${widget.phone}',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/images/Account/Location.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: containerWidth * 0.4,
                    height: 50.h,
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromRGBO(255, 255, 255, 0.17),
                    ),
                    child: Center(
                      child: Text(
                        "حذف",
                        style: TextStyle(
                          color: KprimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ).onTap(() {
                    setState(() {
                      _isVisible = false;
                    });
                  }),
                  SizedBox(width: 20),
                  Container(
                    width: containerWidth * 0.4,
                    height: 50.h,
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: KprimaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        _isEditing ? "حفظ" : "تعديل",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ).onTap(() {
                    if (_isEditing) {
                      _saveChanges();
                    } else {
                      setState(() {
                        _isEditing = true;
                      });
                    }
                  }),
                ],
              ),
            ],
          ),
        )
        : SizedBox();
  }
}

extension on Widget {
  Widget onTap(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}
