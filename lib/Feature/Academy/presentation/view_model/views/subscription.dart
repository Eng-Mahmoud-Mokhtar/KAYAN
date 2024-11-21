import 'package:flutter/material.dart';
import 'package:homepage/Feature/Gym/presentation/view_model/views/pages/subscribe_now.dart';
import '../../../../../../core/colors.dart';
import '../../../../core/utiles/constans.dart';


class SubscriptionAcademy extends StatefulWidget {
  final String AcademyName;
  final String price;
  final String imagePath;

  const SubscriptionAcademy({
    required this.AcademyName,
    required this.price,
    required this.imagePath,
    Key? key,
  }) : super(key: key);
  @override
  State<SubscriptionAcademy> createState() => _SubscriptionAcademyState();
}

class _SubscriptionAcademyState extends State<SubscriptionAcademy> {
  String? selectedSubscription;
  final Map<String, TextEditingController> _controllers = {};

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controllers['daily'] = TextEditingController();
    _controllers['weekly'] = TextEditingController();
    _controllers['monthly'] = TextEditingController();
    _controllers['three_months'] = TextEditingController();
  }

  void _onSubscriptionChange(String subscriptionType) {
    setState(() {
      selectedSubscription = subscriptionType;
    });
  }

  Future<void> _showDatePicker(String subscriptionType) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate;
    DateTime lastDate;
    switch (subscriptionType) {
      case 'daily':
        firstDate = initialDate;
        lastDate = initialDate.add(Duration(days: 30));
        break;
      case 'weekly':
        firstDate = initialDate;
        lastDate = initialDate.add(Duration(days: 90));
        break;
      case 'monthly':
        firstDate = initialDate;
        lastDate = DateTime(initialDate.year + 1);
        break;
      case 'three_months':
        firstDate = initialDate;
        lastDate = initialDate.add(Duration(days: 90));
        break;
      default:
        return;
    }

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: KprimaryColor,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: ColorManager.appBarColor,
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        _controllers[subscriptionType]?.text =
        '${selectedDate.toLocal()}'.split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.appBarColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          'اشترك الان',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.04,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03,vertical: screenWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'اختر طريقة الاشتراك',
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.04,
                    height: 1.0,
                    letterSpacing: -0.41,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildSubscriptionOption(
                  'يومي',
                  'اختر تاريخ اليوم',
                      () => _onSubscriptionChange('daily'),
                  selectedSubscription == 'daily',
                  _controllers['daily']!,
                  screenWidth,
                  screenHeight,
                ),
                SizedBox(height: screenHeight * 0.03),
                _buildSubscriptionOption(
                  'اسبوعي',
                  'اختر تاريخ بداية الاسبوع',
                      () => _onSubscriptionChange('weekly'),
                  selectedSubscription == 'weekly',
                  _controllers['weekly']!,
                  screenWidth,
                  screenHeight,
                ),
                SizedBox(height: screenHeight * 0.03),
                _buildSubscriptionOption(
                  'شهري',
                  'اختر تاريخ الشهر',
                      () => _onSubscriptionChange('monthly'),
                  selectedSubscription == 'monthly',
                  _controllers['monthly']!,
                  screenWidth,
                  screenHeight,
                ),
                SizedBox(height: screenHeight * 0.03),
                _buildSubscriptionOption(
                  '3 شهور',
                  'اختر تاريخ 3 شهور',
                      () => _onSubscriptionChange('three_months'),
                  selectedSubscription == 'three_months',
                  _controllers['three_months']!,
                  screenWidth,
                  screenHeight,
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
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
                      if (_controllers[selectedSubscription]?.text.isEmpty ?? true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'الرجاء تحديد تاريخ بداية الاشتراك',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SubscribeNow(
                              GymName: widget.AcademyName,
                              price: widget.price,
                              imagePath: widget.imagePath,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'تأكيد',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionOption(
      String label,
      String textFieldHint,
      VoidCallback onChanged,
      bool isVisible,
      TextEditingController controller,
      double screenWidth,
      double screenHeight,
      ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: isVisible ? screenWidth * 0.40 : screenWidth * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xff333333),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Checkbox(
                    value: isVisible,
                    onChanged: (bool? value) {
                      if (value == true) {
                        onChanged();
                      }
                    },
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: ColorManager.CheckBoxBorderColor,
                        width: 2.0,
                      ),
                    ),
                    activeColor: ColorManager.CheckBoxColor,
                    checkColor: ColorManager.CheckBoxColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              width: screenWidth * 0.9,
              height: 1,
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.08),
                  width: 1,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Container(
                height: screenWidth * 0.12,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.calendar_today, color: Colors.white),
                      onPressed: () => _showDatePicker(
                        selectedSubscription ?? 'daily',
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          hintText: textFieldHint,
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: screenWidth * 0.04,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManager.appBarColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: KprimaryColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManager.appBarColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
