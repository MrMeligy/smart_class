import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_class/features/main/presentation/manager/statues_cubit/system_statues_cubit.dart';
import 'package:smart_class/features/main/presentation/screens/widgets/measure_element.dart';
import 'package:smart_class/features/main/presentation/screens/widgets/row_measures.dart';

class MeasuresContainer extends StatelessWidget {
  const MeasuresContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemStatuesCubit, SystemStatuesState>(
      listener: (context, state) {
        if (state is SystemStatuesFail) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.err, // خلي المسج dynamic من الـ state
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is SystemStatuesLoading) {
          return _buildLoading();
        } else if (state is SystemStatuesSuccess) {
          return _buildMeasures(state);
        } else {
          return _buildEmpty();
        }
      },
    );
  }

  Widget _buildLoading() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: _containerDecoration(),
      child: Column(
        children: [
          RowOfMeasures(
            first: _loadingElement("Temperature"),
            second: _loadingElement("Humidity"),
          ),
          SizedBox(height: 65.h),
          RowOfMeasures(
            first: _loadingElement("Light Level"),
            second: _loadingElement("Attendance"),
          ),
        ],
      ),
    );
  }

  Widget _buildMeasures(SystemStatuesSuccess state) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: _containerDecoration(),
      child: Column(
        children: [
          RowOfMeasures(
            first: MeasureElement(
              title: "Temperature",
              value: state.statues.temperature.toString(),
              unit: '°C',
            ),
            second: MeasureElement(
              title: "Humidity",
              value: "${state.statues.humidity}%",
            ),
          ),
          SizedBox(height: 65.h),
          RowOfMeasures(
            first: MeasureElement(
              title: "Light Level",
              value: state.statues.lightValue.toString(),
              unit: "lx",
            ),
            second: MeasureElement(
              title: "Attendance",
              value: state.statues.peopleCount.toString(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmpty() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: _containerDecoration(),
      child: Column(
        children: [
          RowOfMeasures(
            first: MeasureElement(title: "Temperature", value: "0", unit: '°C'),
            second: MeasureElement(title: "Humidity", value: "0"),
          ),
          SizedBox(height: 65.h),
          RowOfMeasures(
            first: MeasureElement(title: "Light Level", value: "0", unit: "lx"),
            second: MeasureElement(title: "Attendance", value: "0"),
          ),
        ],
      ),
    );
  }

  Widget _loadingElement(String title) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20.sp, color: Colors.black),
        ),
        Center(child: CircularProgressIndicator()),
      ],
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(174, 255, 255, 255),
          blurRadius: 6,
          offset: Offset(15, 12),
        ),
      ],
      color: Color(0xffE0E0E0),
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
    );
  }
}
