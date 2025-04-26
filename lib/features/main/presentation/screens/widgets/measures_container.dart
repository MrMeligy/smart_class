import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_class/features/main/presentation/manager/statues_cubit/system_statues_cubit.dart';
import 'package:smart_class/features/main/presentation/screens/widgets/measure_element.dart';
import 'package:smart_class/features/main/presentation/screens/widgets/row_measures.dart';

class MeasuresContainer extends StatelessWidget {
  const MeasuresContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemStatuesCubit, SystemStatuesState>(
      listener: (context, state) {
        if (state is SystemStatuesFail) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Wrong IP',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return BlocBuilder<SystemStatuesCubit, SystemStatuesState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(174, 255, 255, 255),
                    blurRadius: 6,
                    offset: Offset(15, 12), // Shadow position
                  ),
                ],
                color: Color(0xffE0E0E0),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: (state is SystemStatuesLoading)
                  ? Column(
                      children: [
                        RowOfMeasures(
                          first: Column(
                            children: [
                              Text(
                                "Temperature",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Center(child: CircularProgressIndicator()),
                            ],
                          ),
                          second: Column(
                            children: [
                              Text(
                                "Humedity",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Center(child: CircularProgressIndicator()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 65.h,
                        ),
                        RowOfMeasures(
                          first: Column(
                            children: [
                              Text(
                                "Light Level",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Center(child: CircularProgressIndicator()),
                            ],
                          ),
                          second: Column(
                            children: [
                              Text(
                                "Attendence",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Center(child: CircularProgressIndicator()),
                            ],
                          ),
                        ),
                      ],
                    )
                  : (state is SystemStatuesSuccess)
                      ? Column(
                          children: [
                            RowOfMeasures(
                              first: MeasureElement(
                                title: "Temperature",
                                value: state.statues.temperature.toString(),
                                unit: '°C',
                              ),
                              second: MeasureElement(
                                title: "Humedity",
                                value: "${state.statues.humidity.toString()}%",
                              ),
                            ),
                            SizedBox(
                              height: 65.h,
                            ),
                            RowOfMeasures(
                              first: MeasureElement(
                                title: "Light Level",
                                value: state.statues.lightValue.toString(),
                                unit: "lx",
                              ),
                              second: MeasureElement(
                                title: "Attendece",
                                value: state.statues.peopleCount.toString(),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            RowOfMeasures(
                              first: MeasureElement(
                                title: "Temperature",
                                value: "0",
                                unit: '°C',
                              ),
                              second: MeasureElement(
                                title: "Humedity",
                                value: "0",
                              ),
                            ),
                            SizedBox(
                              height: 65.h,
                            ),
                            RowOfMeasures(
                              first: MeasureElement(
                                title: "Light Level",
                                value: "0",
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
          },
        );
      },
    );
  }
}
