import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_class/features/main/presentation/manager/cubit/system_control_cubit.dart';
import 'package:smart_class/features/main/presentation/manager/statues_cubit/system_statues_cubit.dart';
import 'package:smart_class/features/settings/presentation/screens/settings_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

Widget buildCover() {
  return Builder(
    builder: (context) => Container(
      height: 150.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        color: Color(0xff2C2C44),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 30.h,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Row(
                spacing: 10.w,
                children: [
                  Text(
                    "Smart Classroom",
                    style: TextStyle(
                      fontSize: 26.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  BlocBuilder<SystemControlCubit, SystemControlState>(
                    builder: (context, state) {
                      return Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: (state is SystemControlOn)
                              ? Colors.greenAccent
                              : Colors.red, //Color(0xff23C48E),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: ToggleSwitch(
              curve: Curves.linear,
              animationDuration: 150,
              animate: true,
              minWidth: 60.0,
              cornerRadius: 50.0,
              labels: [
                "Off",
                "On",
              ],
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
              onToggle: (index) {
                if (index == 0) {
                  context.read<SystemControlCubit>().systemControl(mode: "off");
                  context.read<SystemStatuesCubit>().offStatus();
                } else if (index == 1) {
                  context.read<SystemControlCubit>().systemControl(mode: "on");
                  context.read<SystemStatuesCubit>().getStatues();
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}
