import 'package:flutter/material.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';

class Tracking extends StatefulWidget {
  const Tracking({Key? key}) : super(key: key);

  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  List<bool> _isChecked = [false, false, false];

  void _toggleCheck(int index) {
    setState(() {
      if (index < 2) {
        _isChecked[index] = true;
      } else if (index == 2) {
        _isChecked[2] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(36, 36, 36, 1),
            ),
            child: Column(
              children: [
                _buildTrackingItem('9:30 يناير, 08 صباحا', 'قيد التحضير', 'qcry3764', 0),
                _buildTrackingItem('9:30 يناير, 08 صباحا', 'تحت التنفيذ', 'qcry3764', 1),
                _buildTrackingItem('9:30 يناير, 08 صباحا', 'تم التوصيل', 'qcry3764', 2),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTrackingItem(String dateTime, String status, String orderNumber, int index) {
    return GestureDetector(
      onTap: () => _toggleCheck(index), // استدعاء الدالة عند الضغط
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(255, 255, 255, 0.08),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      dateTime,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(103, 104, 109, 1)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          status,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              orderNumber,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(103, 104, 109, 1)),
                            ),
                            Text(
                              'رقم الاوردر',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(103, 104, 109, 1)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (index < 2 && _isChecked[index])
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: KprimaryColor,
                            ),
                          )
                        else if (index == 2 && _isChecked[index])
                          Icon(Icons.check_circle, color: KprimaryColor, size: 24)
                        else
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey, // لون النقطة الرمادية
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
