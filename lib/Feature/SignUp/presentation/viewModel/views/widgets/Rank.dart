import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utiles/constans.dart';

class Rank extends StatefulWidget {
  const Rank({super.key});

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  final TextEditingController _rankController = TextEditingController();
  bool _isRankValid = false;
  bool _formSubmitted = false;

  @override
  void dispose() {
    _rankController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'الرتبة',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: screenWidth,
          height: screenWidth * 0.12,
          child: TextField(
            controller: _rankController,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.right,
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'اختر الرتبة',
              filled: true,
              fillColor: Color.fromRGBO(50, 50, 50, 1),
              errorText: _formSubmitted && !_isRankValid
                  ? 'يرجى اختيار الرتبة'
                  : null,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: screenWidth * 0.035,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: PopupMenuButton<String>(
                icon: Icon(
                  Icons.arrow_drop_down_outlined,
                  size: screenWidth * 0.06,
                  color: Colors.grey.shade600,
                ),
                offset: Offset(0, screenWidth * 0.12),
                color: Color.fromRGBO(51, 51, 51, 1),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'ملف شخصي',
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'ملف شخصي',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'مصور',
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'مصور فوتوغرافي',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'مدرب',
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'مدرب',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'تاجر',
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'تاجر',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'صاحب أكاديمية',
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'صاحب أكاديمية',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
                onSelected: (String value) {
                  setState(() {
                    _rankController.text = value;
                    _isRankValid = true;
                    _formSubmitted = true;
                  });
                },
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: KprimaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
