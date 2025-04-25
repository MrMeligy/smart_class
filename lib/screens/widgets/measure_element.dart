import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeasureElement extends StatelessWidget {
  const MeasureElement({
    super.key,
    required this.title,
    required this.value,
    this.unit,
  });
  final String title;
  final String value;
  final String? unit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 15.sp,
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 26.sp),
            children: [
              TextSpan(text: value),
              WidgetSpan(
                alignment: PlaceholderAlignment.top,
                child: Transform.translate(
                  offset: Offset(2, -10), // ترفعه لفوق شوية
                  child: Text(
                    unit ?? '',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
