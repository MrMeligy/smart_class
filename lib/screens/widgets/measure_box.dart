import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_class/screens/widgets/measures_container.dart';

class MeasureBox extends StatelessWidget {
  const MeasureBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 110.h,
      right: 30.w,
      left: 30.w,
      child: Stack(
        children: [
          MeasuresContainer(),
          Positioned(
            top: 122.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              height: 2.h,
              width: 300.w,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 20.h,
            top: 20.h,
            left: 188.w,
            child: Container(
              height: 250.h,
              width: 2.w,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
