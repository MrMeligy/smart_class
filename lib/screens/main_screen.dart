import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_class/screens/widgets/cover.dart';
import 'package:smart_class/screens/widgets/measure_box.dart';
import 'package:smart_class/screens/widgets/smoke_element.dart';
import 'package:smart_class/screens/widgets/switcher_groub.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff1B1725),
              const Color(0xffA499B3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  // CustomAppBar(),
                  buildCover(),
                  SizedBox(
                    height: 15.h,
                  ),
                  MeasureBox(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35.w,
                ),
                child: SwitchersGroup(),
              ),
              SizedBox(
                height: 25.h,
              ),
              CircularGaugeWidget(
                currentValue: 0,
                size: 280,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
