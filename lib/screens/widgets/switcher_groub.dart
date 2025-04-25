import 'package:flutter/material.dart';
import 'package:smart_class/screens/widgets/row_measures.dart';
import 'package:smart_class/screens/widgets/switcher.dart';

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
          ),
          second: Switcher(
            title: "Curtain",
            iconData: Icons.curtains,
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switcher(
              title: "Projector",
              iconData: Icons.theaters,
            ),
          ],
        ),

        // Projector(),
        RowOfMeasures(
          first: Switcher(
            title: "Fan",
            iconData: Icons.wind_power,
          ),
          second: Switcher(
            title: "System",
            iconData: Icons.settings,
          ),
        ),
      ],
    );
  }
}
