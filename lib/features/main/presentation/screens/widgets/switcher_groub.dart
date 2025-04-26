import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_class/features/main/presentation/manager/repo/main_repo_impl.dart';
import 'package:smart_class/features/main/presentation/screens/widgets/row_measures.dart';
import 'package:smart_class/features/main/presentation/screens/widgets/switcher.dart';
import 'package:smart_class/core/service_locator/service_locator.dart';

class SwitchersGroup extends StatelessWidget {
  const SwitchersGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowOfMeasures(
          first: Switcher(
            title: "Light",
            iconData: Icons.light_mode,
            onToggle: _lightpower,
          ),
          second: Switcher(
            title: "Curtain",
            iconData: Icons.curtains,
            onToggle: _curtaipower,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        // Projector(),
        RowOfMeasures(
          first: Switcher(
            title: "Fan",
            iconData: Icons.wind_power,
            onToggle: _fanpower,
          ),
          second: Switcher(
            title: "Projector",
            iconData: Icons.theaters,
            onToggle: _projector,
          ),
        ),
      ],
    );
  }
}

void _lightpower(int? index) {
  if (index == 0) {
    getIt<MainRepoImpl>().lightPower(power: "off");
  } else {
    getIt<MainRepoImpl>().lightPower(power: "on");
  }
}

void _curtaipower(int? index) {
  if (index == 0) {
    getIt<MainRepoImpl>().windowControl(mode: "off");
  } else {
    getIt<MainRepoImpl>().windowControl(mode: "on");
  }
}

void _projector(int? index) {
  if (index == 0) {
    getIt<MainRepoImpl>().projectorControl(mode: "down");
  } else {
    getIt<MainRepoImpl>().projectorControl(mode: "up");
  }
}

void _fanpower(int? index) {
  if (index == 0) {
    getIt<MainRepoImpl>().fanPower(power: "auto");
  } else {
    getIt<MainRepoImpl>().fanPower(power: "manual");
  }
}
