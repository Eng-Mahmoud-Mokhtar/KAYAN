import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homepage/Feature/Balls/presentation/view_model/views/Balls.dart';
import 'package:homepage/Feature/Protine/presentation/view_model/views/Protine.dart';
import 'package:homepage/Feature/Services/presentation/view_model/views/widgets/RowServices.dart';
import '../../../../../core/appbar_widget.dart';
import '../../../../../core/colors.dart';
import '../../../../Bags/presentation/view_model/views/SportBags.dart';
import '../../../../BallPool/presentation/view_model/views/BallPool.dart';
import '../../../../Home/presentation/view_model/views/widgets/bottomBar.dart';
import '../../../../Playground/presentation/view_model/views/Stadiums.dart';
import '../../../../ProudectStadiem/presentation/view_model/views/ProudectStadiem.dart';
import '../../../../SportsClothese/presentation/view_model/views/SportClothese.dart';
import '../../../../SportsShose/presentation/view_model/views/SportShose.dart';
import '../../../../playstation/presentation/view_model/views/AllPlaystation.dart';


class AllStore extends StatefulWidget {
  const AllStore({Key? key}) : super(key: key);

  @override
  State<AllStore> createState() => _AllStoreState();
}

class _AllStoreState extends State<AllStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.Black,
      appBar: appBarContent(
        title: "المتجر",
        onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomHome()),
      );
    },),
    body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildRow(context, [
                {'title': 'تجهيزات الملاعب', 'urlImage': 'images/Store/Group.png', 'page': ProudectStadiem()},
                {'title': 'احذية رياضية', 'urlImage': 'images/Store/svgexport-17 (90) 1.png', 'page': SportShose()},
              ]),
              SizedBox(height: 16.h),
              buildRow(context, [
                {'title': 'ملابس رياضية', 'urlImage': 'images/Store/svgexport-17 (71) 1.png', 'page': SportClothese()},
                {'title': 'شنط رياضية', 'urlImage': 'images/Store/Group (2).png', 'page': SportBags()},
              ]),
              SizedBox(height: 16.h),
              buildRow(context, [
                {'title': 'كرة', 'urlImage': 'images/Service/Group (1).png', 'page': Balls()},
                {'title': 'مكملات غذائية', 'urlImage': 'images/Store/Group (1).png', 'page': Protine()},
              ]),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
