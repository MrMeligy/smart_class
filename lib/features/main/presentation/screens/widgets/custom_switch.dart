import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    this.isVertical,
    this.onToggle,
  });
  final bool? isVertical;
  final void Function(int?)? onToggle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: ToggleSwitch(
        isVertical: isVertical ?? false,
        curve: Curves.linear,
        animationDuration: 150,
        animate: true,
        minWidth: 35.0,
        cornerRadius: 50.0,
        activeBgColors: [
          [Color(0xff424242)],
          [Color(0xff00C853)]
        ],
        activeFgColor: Colors.white,
        inactiveBgColor: Color(0xffD4D4D4),
        inactiveFgColor: Colors.white,
        initialLabelIndex: 0,
        totalSwitches: 2,
        radiusStyle: true,
        onToggle: (index) {
          if (onToggle != null) {
            onToggle!(index); // Call the callback with the index
          }
        },
      ),
    );
  }
}
