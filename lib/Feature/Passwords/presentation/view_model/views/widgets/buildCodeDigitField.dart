import 'package:flutter/material.dart';

class CodeFieldsWidget extends StatefulWidget {
  const CodeFieldsWidget({Key? key}) : super(key: key);

  @override
  State<CodeFieldsWidget> createState() => _CodeFieldsWidgetState();
}

class _CodeFieldsWidgetState extends State<CodeFieldsWidget> {
  List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  Widget buildCodeDigitFields(BuildContext context) {
    List<Widget> digitFields = [];
    double screenWidth = MediaQuery.of(context).size.width;
    double margin = screenWidth * 0.02;

    for (int i = 0; i < 4; i++) {
      digitFields.add(buildCodeDigitField(context, i, margin, screenWidth));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: digitFields,
    );
  }

  Widget buildCodeDigitField(BuildContext context, int digitIndex, double margin, double screenWidth) {
    double height = screenWidth * 0.15; // Adjust the height proportionally

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(margin),
        height: height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(51, 51, 51, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: TextFormField(
              controller: controllers[digitIndex],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              focusNode: focusNodes[digitIndex],
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (digitIndex < 3) {
                    FocusScope.of(context).requestFocus(focusNodes[digitIndex + 1]);
                  }
                }
              },
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildCodeDigitFields(context);
  }
}
