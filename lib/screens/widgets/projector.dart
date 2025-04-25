import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Projector extends StatelessWidget {
  const Projector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Projector",
          style: TextStyle(
            fontSize: 28.sp,
          ),
        ),
        SizedBox(
          height: 15.sp,
        ),
        IconButton(
          iconSize: 35,
          color: Colors.black,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Color(0xff6F6F6F)),
          ),
          onPressed: () {},
          icon: Icon(
            Icons.upload_sharp,
          ),
        ),
      ],
    );
  }
}
