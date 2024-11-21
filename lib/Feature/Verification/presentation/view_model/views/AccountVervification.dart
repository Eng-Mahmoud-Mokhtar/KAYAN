import 'package:flutter/material.dart';
import 'package:homepage/Feature/Verification/presentation/view_model/views/widgets/Detailes.dart';
import 'package:homepage/Feature/Verification/presentation/view_model/views/widgets/confirmation.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';
import '../../../../../core/appbar_widget.dart';

class AccountVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarContent(
        title: "توثيق الحساب",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.verified,
                color: Colors.blueAccent,
                size: 100,
              ),
              SizedBox(height: 20),
              Text(
                'توثيق الحساب يعد خطوة أساسية لحماية بياناتك الشخصية وضمان أمان حسابك من الوصول غير المصرح به. '
                    'كما يعزز ثقتك في استخدام التطبيق ويوفر لك مزايا إضافية، مثل الوصول إلى أدوات وخصائص مميزة. '
                    'توثيق الحساب يساعد أيضًا في التحقق من هويتك، مما يمنع انتحال الشخصية ويزيد من مصداقيتك. '
                    'من خلال توثيق الحساب، ستكون لديك القدرة على الاستفادة من العروض والخصومات الحصرية التي يقدمها التطبيق، '
                    'كما يمكنك الاستفادة من الدعم الفني بشكل أسرع وأفضل. '
                    'بالإضافة إلى ذلك، سيمكنك التوثيق من الوصول إلى ميزات متقدمة، مثل تخصيص الإعدادات الشخصية أو الاستفادة من أدوات جديدة ومبتكرة.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.8,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
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
                        builder: (context) => DetailesVerifi(),
                      ),
                    );
                  },
                  child: Text(
                    'طلب التوثيق',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
