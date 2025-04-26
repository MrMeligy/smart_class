import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_class/features/main/presentation/manager/statues_cubit/system_statues_cubit.dart';
import 'package:smart_class/features/main/presentation/screens/widgets/cover.dart';
import 'package:smart_class/features/main/presentation/screens/widgets/measure_box.dart';
import 'package:smart_class/features/main/presentation/screens/widgets/switcher_groub.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff1E1E2F),
              Color(0xff3A4F7A),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  // CustomAppBar(),
                  buildCover(),
                  SizedBox(
                    height: 15.h,
                  ),
                  MeasureBox(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.48,
                  )
                ],
              ),
              Text(
                "Smoke",
                style: TextStyle(
                  fontSize: 26.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              BlocBuilder<SystemStatuesCubit, SystemStatuesState>(
                builder: (context, state) {
                  return SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        startAngle: 180,
                        endAngle: 0,
                        minimum: 0,
                        maximum: 2500,
                        showLabels: false,
                        showTicks: false,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.2,
                          thicknessUnit: GaugeSizeUnit.factor,
                          gradient: SweepGradient(
                            colors: [
                              Color(0xffFFD93D),
                              Colors.red,
                            ],
                            stops: [0.0, 1.0],
                          ),
                        ),
                        pointers: <GaugePointer>[
                          MarkerPointer(
                            value: (state is SystemStatuesSuccess)
                                ? double.parse(
                                    state.statues.smokeValue.toString())
                                : 0,
                            markerType: MarkerType.circle,
                            color: Colors.black87,
                            markerHeight: 20,
                            markerWidth: 20,
                          ),
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Text(
                              (state is SystemStatuesSuccess)
                                  ? "${state.statues.smokeValue}"
                                  : '0',
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            angle: 90,
                            positionFactor: 0.1,
                          ),
                          GaugeAnnotation(
                            widget: Text(
                              'Min',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            angle: 180,
                            positionFactor: 1.1,
                          ),
                          GaugeAnnotation(
                            widget: Text(
                              'Max',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            angle: 0,
                            positionFactor: 1.1,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35.w,
                ),
                child: SwitchersGroup(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
