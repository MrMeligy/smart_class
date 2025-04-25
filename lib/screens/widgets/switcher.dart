import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_class/screens/widgets/custom_switch.dart';

class Switcher extends StatelessWidget {
  const Switcher({
    super.key,
    required this.title,
    this.iconData,
  });
  final String title;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          spacing: 5.w,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 25.sp,
                color: Colors.white,
              ),
            ),
            Icon(
              iconData,
              color: Colors.white,
            )
          ],
        ),
        SizedBox(
          width: 15.w,
        ),
        CustomSwitch(),
      ],
    );
  }
}
