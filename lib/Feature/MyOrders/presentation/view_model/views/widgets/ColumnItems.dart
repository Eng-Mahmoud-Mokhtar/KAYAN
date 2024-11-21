import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/constans.dart';
import 'ArrowDetails.dart';
import '../DetailsOrderScreen.dart';

class ColumnItems extends StatefulWidget {
  const ColumnItems({Key? key}) : super(key: key);

  @override
  State<ColumnItems> createState() => _ColumnItemsState();
}

class _ColumnItemsState extends State<ColumnItems> {
  bool isOrderCanceled = false;
  List<String> orders = ['order1'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (orders.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromRGBO(36, 36, 36, 1),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArrowDetails(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: KprimaryColor,
                            size: 20,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'رقم الاوردر- #qcry3764 ',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  'تاريخ الاوردر-10/15/2023 ',
                                  style: TextStyle(color: Colors.white70),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/Account/Group 1000004386.png')),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'جنية ',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '2000 ',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        Expanded(child: SizedBox(width: 1)),
                        Text(
                          'سعر (4 عناصر)',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(103, 104, 109, 1)),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(255, 255, 255, 0.08),
                    thickness: 3,
                    endIndent: 20,
                    indent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          'قيد التحضير ',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.orange,
                        ),
                        Expanded(child: SizedBox(width: 1)),
                        Text(
                          'الحالة',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(103, 104, 109, 1)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _showConfirmationDialog(context);
                            },
                            child: Container(
                              height: 60,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromRGBO(255, 255, 255, 0.17),
                              ),
                              child: Center(
                                child: Text(
                                  "الغاء الاوردر",
                                  style: TextStyle(
                                    color: KprimaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TrackingOrder()),
                              );
                            },
                            child: Container(
                              height: 60,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                color: KprimaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "تتبع الاوردر",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(67, 71, 67, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Container(
            height: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Account/svgexport-10 (84) 2 (1).png',
                ),
                SizedBox(height: 30),
                Text(
                  'هل تريد الغاء هذا الطلب ؟',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  height: 60,
                  width: 320,
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: KprimaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      // إذا تم إلغاء الطلبات يتم تحديث القائمة
                      setState(() {
                        isOrderCanceled = true;
                        orders.removeAt(0); // إزالة الطلب
                      });
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        "نعم",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 60,
                    width: 320,
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: KprimaryColor),
                    ),
                    child: Center(
                      child: Text(
                        "لا",
                        style: TextStyle(
                          color: KprimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
