import 'package:flutter/material.dart';
import 'package:homepage/Feature/Camera/presentation/view_model/views/widgets/ButtonCamera.dart';
import '../../../../../core/utiles/GreenCircle.dart';
import '../../../../../core/utiles/constans.dart';
import 'amount.dart';


class ConfirmationCamera extends StatefulWidget {
  ConfirmationCamera({super.key});

  @override
  State<ConfirmationCamera> createState() => _ConfirmationCameraState();
}

class _ConfirmationCameraState extends State<ConfirmationCamera> {
  int selected = 0;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff302F2D),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_forward_sharp, color: Colors.white),
          ),
        ],
        centerTitle: true,
        title: Text(
          'تاكيد الطلب',
          style: TextStyle(color: Colors.white,fontSize: screenWidth * 0.04),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'اختر طريقة الدفع',
                    style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    color: Color(0xff302F2D),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: screenWidth * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SmallImage(image: 'images/images.png'),
                            SmallImage(image: 'images/Old_Visa_Logo 1.png'),
                            Spacer(flex: 1),
                            Text(
                              'فيزا',
                              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04, fontWeight: FontWeight.w400),
                            ),
                            GreenCircal(
                              color: selected == 1 ? Colors.green : Color(0xff302F2D),
                            ),
                          ],
                        ),
                      ),
                      selected == 1
                          ? Container(
                        width: double.infinity,
                        child: AspectRatio(
                          aspectRatio: 3.2 / 2,
                          child: InputContainer(
                            textEditingController: _textEditingController,
                            text12: 'رقم الكارد',
                            text11: 'رقم الكارد',
                            text21: 'تاريخ الصلاحيه',
                            text22: 'MM/YY',
                            text31: 'كود الامان',
                            text32: 'CVV',
                          ),
                        ),
                      )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 2;
                  });
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    color: Color(0xff302F2D),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: screenWidth * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SmallImage(image: 'images/Vodafone 1.png'),
                            SmallImage(image: 'images/etisalat-cash-logo 1.png'),
                            SmallImage(image: 'images/Orange-Cash-logo-home-en 1.png'),
                            Spacer(flex: 1),
                            Text(
                              'كاش',
                              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04, fontWeight: FontWeight.w400),
                            ),
                            GreenCircal(
                              color: selected == 2 ? Colors.green : Color(0xff302F2D),
                            ),
                          ],
                        ),
                      ),
                      selected == 2
                          ? Container(
                        width: double.infinity,
                        child: AspectRatio(
                          aspectRatio: 3.2 / 2,
                          child: InputContainer(
                            textEditingController: _textEditingController,
                            text12: 'اكتب اسم الشخص',
                            text11: 'اسم الشخص',
                            text21: 'رقم المحول منه',
                            text22: 'اكتب رقم المحول منه',
                            text31: 'رقم المحول عليه',
                            text32: 'اكتب رقم المحول عليه',
                          ),
                        ),
                      )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 0;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    color: Color(0xff302F2D),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SmallImage(image: 'images/svgexport-18 (4) 2.png'),
                      Spacer(flex: 1),
                      Text(
                        'نقدا',
                        style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04, fontWeight: FontWeight.w400),
                      ),
                      GreenCircal(
                        color: selected == 0 ? Colors.green : Color(0xff302F2D),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Add(text: 'اضافة كود الكوبون'),
            Add(text: 'اضافة عدد النقاط'),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "ملخص الطلب",
                    style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Color(0xFF283725), Color(0xFF191C18)],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Column(
                    children: [
                      OrderSummary(price: '1500', text: 'سعر الطلب'),
                      OrderSummary(price: '500', text: 'خصم كود البون'),
                      OrderSummary(price: '600', text: 'خصم عدد النقاط'),
                      Divider(color: Colors.white60, thickness: 1),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: OrderSummary(price: '400', text: 'سعر النهائي'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Container(
                width: screenWidth,
                height: screenWidth * 0.12,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KprimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AttachTransferCamera(),
                      ),
                    );
                  },
                  child: Text(
                    'تاكيد الطلب',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class InputContainer extends StatelessWidget {
  const InputContainer({
    super.key,
    required TextEditingController textEditingController,
    required this.text11,
    required this.text12,
    required this.text21,
    required this.text22,
    required this.text31,
    required this.text32,
  });
  final String text11;
  final String text12;
  final String text21;
  final String text22;
  final String text31;
  final String text32;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double containerHeight = screenHeight * 0.4;
    final double dividerIndent = screenWidth * 0.05;
    return Container(
      width: double.infinity,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        color: Color(0xff302F2D),
      ),
      child: Column(
        children: [
          Divider(
            color: Colors.white30,
            indent: dividerIndent,
            endIndent: dividerIndent,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'رقم الكارد',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: screenWidth * 0.12,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          hintText: 'اكتب رقم الكارد',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.035,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: KprimaryColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'كود الامان',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 0.04,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Container(
                            height: screenWidth * 0.12,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade800,
                                hintText: 'CVV',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.035,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: KprimaryColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'تاريخ الصلاحية',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: screenWidth * 0.04,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Container(
                            height: screenWidth * 0.12,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade800,
                                hintText: 'MM / YY',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.035,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: KprimaryColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class SmallImage extends StatelessWidget {
  const SmallImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final double imageSize = screenWidth * 0.075;

    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.03),
      child: Container(
        width: imageSize,
        height: imageSize,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    required this.price,
    required this.text,
  });
  final String price;
  final String text;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textSize = screenWidth * 0.04;
    final double padding = screenWidth * 0.02;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'جنية',
            style: TextStyle(
              color: Colors.white,
              fontSize: textSize,
            ),
          ),
          SizedBox(width: padding),
          Text(
            price,
            style: TextStyle(
              color: Colors.white,
              fontSize: textSize,
            ),
          ),
          Spacer(flex: 1),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: textSize,
            ),
          ),
        ],
      ),
    );
  }
}


class Add extends StatelessWidget {
  const Add({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textSizeTitle = screenWidth * 0.04;
    final double textSizeSubtitle = screenWidth * 0.04;
    final double padding = screenWidth * 0.02;
    final double innerContainerWidth = screenWidth * 0.3;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: textSizeTitle,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: screenWidth * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
              color: Color(0xff302F2D),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Container(
                    width: innerContainerWidth,
                    height: screenWidth * 0.12,
                    child: ButtomCamera(
                      buttomtext: 'تطبيق',
                      width: double.infinity,
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: textSizeSubtitle,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
