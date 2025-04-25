import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    this.isVertical,
  });
  final bool? isVertical;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: ToggleSwitch(
        isVertical: isVertical ?? false,
        curve: Curves.linear,
        animationDuration: 150,
        animate: true,
        minWidth: 40.0,
        cornerRadius: 50.0,
        activeBgColors: [
          [Color.fromARGB(255, 78, 77, 77)],
          [Color.fromARGB(255, 23, 212, 149)]
        ],
        activeFgColor: Colors.white,
        inactiveBgColor: Color(0xffD4D4D4),
        inactiveFgColor: Colors.white,
        initialLabelIndex: 0,
        totalSwitches: 2,
        radiusStyle: true,
        onToggle: (index) {},
      ),
    );
  }
}
