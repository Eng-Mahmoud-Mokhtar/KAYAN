import 'package:flutter/material.dart';
import 'package:homepage/Feature/core/utiles/constans.dart';

class SuccessfullyPassword extends StatefulWidget {
  @override
  _SuccessfullyPasswordState createState() => _SuccessfullyPasswordState();
}

class _SuccessfullyPasswordState extends State<SuccessfullyPassword>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool showCheckMark = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _startAnimation();
  }

  void _startAnimation() {
    _controller.forward();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showCheckMark = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 330,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(67, 71, 67, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 75, bottom: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 1.8,
                        child: CircularProgressIndicator(
                          value: _animation.value,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(KprimaryColor),
                          strokeWidth: 2,
                        ),
                      );
                    },
                  ),
                  if (showCheckMark)
                    Transform.scale(
                      scale: 1.5,
                      child: Icon(
                        Icons.check,
                        size: 37,
                        color: KprimaryColor,
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 20),
              child: Text(
                'تم تغير كلمه السر بنجاح',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 290,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KprimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'تم',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
