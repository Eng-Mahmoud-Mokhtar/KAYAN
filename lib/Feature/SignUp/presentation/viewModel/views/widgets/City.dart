import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utiles/constans.dart';
import 'ListCityes.dart';

class City extends StatefulWidget {
  const City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  final TextEditingController _countryController = TextEditingController();
  bool _isCountryValid = false;
  bool _formSubmitted = false;

  @override
  void dispose() {
    _countryController.dispose();
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
                'المحافظة',
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
          child: TextFormField(
            controller: _countryController,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.right,
            readOnly: true, // يجعل حقل النص غير قابل للتحرير ويظهر السهم المنسدل
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(50, 50, 50, 2),
              hintText: 'اختر المحافظة',
              errorText: _formSubmitted && !_isCountryValid
                  ? 'يرجى اختيار المحافظة'
                  : null,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: screenWidth * 0.035,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.02),
                child: GestureDetector(
                  onTap: () {
                    showGovernoratesDialog(context);
                  },
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: screenWidth * 0.06,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: KprimaryColor),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _isCountryValid = value.isNotEmpty;
              });
            },
          ),
        ),
      ],
    );
  }

  void showGovernoratesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Color.fromRGBO(51, 51, 51, 1),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Scrollbar(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: egyptGovernorates.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.black54,
                  thickness: 1,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      egyptGovernorates[index],
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      setState(() {
                        _countryController.text = egyptGovernorates[index];
                        _isCountryValid = true;
                        _formSubmitted = true; // تحديث حالة تقديم النموذج
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
