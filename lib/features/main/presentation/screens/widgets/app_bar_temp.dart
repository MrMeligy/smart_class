import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarTempreture extends StatelessWidget {
  const AppBarTempreture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "29.6°C",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
      ),
    );
  }
}
