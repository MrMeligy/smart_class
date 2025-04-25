import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_class/screens/widgets/measure_element.dart';
import 'package:smart_class/screens/widgets/row_measures.dart';

class MeasuresContainer extends StatelessWidget {
  const MeasuresContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(158, 125, 129, 111),
            blurRadius: 6,
            offset: Offset(15, 12), // Shadow position
          ),
        ],
        color: Color(0xffD6EADF),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          RowOfMeasures(
            first: MeasureElement(
              title: "Temperature",
              value: "29.6",
              unit: '°C',
            ),
            second: MeasureElement(
              title: "humedity",
              value: "80%",
            ),
          ),
          SizedBox(
            height: 65.h,
          ),
          RowOfMeasures(
            first: MeasureElement(
              title: "Light Level",
              value: "1023",
              unit: "lx",
            ),
            second: MeasureElement(
              title: "Attendece",
              value: "0",
            ),
          ),
        ],
      ),
    );
  }
}
