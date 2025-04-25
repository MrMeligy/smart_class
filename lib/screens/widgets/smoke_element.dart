import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularGaugeWidget extends StatelessWidget {
  final double currentValue;
  final double maxValue;
  final double minValue;
  final double size;
  final Color trackColor;
  final Color progressColor;
  final double strokeWidth;

  const CircularGaugeWidget({
    super.key,
    required this.currentValue,
    this.maxValue = 2000,
    this.minValue = 0,
    this.size = 170,
    this.trackColor = Colors.white,
    this.progressColor = const Color(0xFF6200EE),
    this.strokeWidth = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Smoke",
              style: TextStyle(
                fontSize: 26.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: size,
              height: size,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Circular track
                  CustomPaint(
                    size: Size(size, size),
                    painter: CircularTrackPainter(
                      trackColor: trackColor,
                      strokeWidth: strokeWidth,
                    ),
                  ),

                  // Progress indicator
                  CustomPaint(
                    size: Size(size, size),
                    painter: CircularProgressPainter(
                      progressColor: progressColor,
                      strokeWidth: strokeWidth,
                      currentValue: currentValue,
                      minValue: minValue,
                      maxValue: maxValue,
                    ),
                  ),

                  // Center value text
                  Text(
                    '${currentValue.toInt()}',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // Min and Max labels
                  Positioned(
                    left: 20.w,
                    bottom: size / 3 - 10,
                    child: Text(
                      minValue.toInt().toString(),
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Positioned(
                    right: 0.w,
                    bottom: size / 3 - 10,
                    child: Center(
                      child: Text(
                        maxValue.toInt().toString(),
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CircularTrackPainter extends CustomPainter {
  final Color trackColor;
  final double strokeWidth;

  CircularTrackPainter({
    required this.trackColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2.5;

    final paint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw the track (arc from -pi to 0, which is bottom half)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CircularProgressPainter extends CustomPainter {
  final Color progressColor;
  final double strokeWidth;
  final double currentValue;
  final double minValue;
  final double maxValue;

  CircularProgressPainter({
    required this.progressColor,
    required this.strokeWidth,
    required this.currentValue,
    required this.minValue,
    required this.maxValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Calculate the sweep angle based on the current value
    final normalizedValue = (currentValue - minValue) / (maxValue - minValue);
    final sweepAngle = normalizedValue * pi; // Half circle (pi radians)

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
