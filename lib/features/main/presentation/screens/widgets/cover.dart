import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCover() {
  return Container(
    height: 150.h,
    width: double.infinity,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      ),
      color: Color.fromARGB(255, 102, 106, 129),
    ),
    child: Row(
      spacing: 5.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Smart Classroom",
          style: TextStyle(
            fontSize: 26.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.red, //Color(0xff23C48E),
          ),
        )
      ],
    ),
  );
}
