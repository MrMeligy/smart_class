import 'package:flutter/material.dart';

class RowOfMeasures extends StatelessWidget {
  const RowOfMeasures({
    super.key,
    required this.first,
    required this.second,
  });
  final Widget first;
  final Widget second;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        first,
        second,
      ],
    );
  }
}
