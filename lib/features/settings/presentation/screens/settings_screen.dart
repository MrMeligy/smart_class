import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_class/core/cache/cache_helper.dart';
import 'package:smart_class/core/service_locator/service_locator.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController controller = TextEditingController();

  void saveIP() {
    if (controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please Enter IP')),
      );
      return;
    }
    setState(() {
      getIt<CacheHelper>().saveData(key: "ip", value: controller.text.trim());
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please Restart The App To Save Changes')),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10.h,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add IP of ESP32",
              style: TextStyle(fontSize: 18.sp),
            ),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'IP Address',
                hintText: 'EX: 192.168.1.60',
                prefixIcon: Icon(Icons.wifi),
                suffixIcon: IconButton(
                  onPressed: () {
                    saveIP();
                  },
                  icon: Icon(Icons.save_sharp),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            (getIt<CacheHelper>().getDataString(key: "ip") != null &&
                    getIt<CacheHelper>().getDataString(key: "ip")!.isNotEmpty)
                ? Text(
                    "Current IP: ${getIt<CacheHelper>().getDataString(key: "ip")}",
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  )
                : Text(
                    "Current IP:",
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
