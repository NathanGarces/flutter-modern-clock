import 'dart:math';

import 'package:flutter/material.dart';

class ClockHands extends StatelessWidget {
  final DateTime time;
  final Color minuteAndHourHandColor;

  const ClockHands(
      {Key key,
      @required this.time,
      this.minuteAndHourHandColor = const Color(0xFFB692FF)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClockHandsPainter(time.second as double, time.minute as double,
          time.hour as double, minuteAndHourHandColor),
      size: Size(400, 400),
    );
  }
}

class _ClockHandsPainter extends CustomPainter {
  final double _second;
  final double _minute;
  final double _hour;
  final Color _minuteAndHourHandColor;

  _ClockHandsPainter(
      this._second, this._minute, this._hour, this._minuteAndHourHandColor);

  double calculateRadians(double val, int factor) {
    //Factor used to convert degrees to radians.
    var radianFactor = pi / 180;
    //Used to offset the hands to the correct place
    var degreeOffset = 90;

    //First convert val to degrees (then subtract 90 degrees), then to radians.
    return ((val * factor) - degreeOffset) * radianFactor;
  }

  //Used to calculate the x-coordinate on the circle where the hand either starts or ends.
  double calculateXCoord(double center, int offset, double radians) {
    //Add offset to center circle radius to get the total radius.
    return center + (5 + offset) * cos(radians);
  }

  //Used to calculate the y-coordinate on the circle where the hand either starts or ends.
  double calculateYCoord(double center, int offset, double radians) {
    //Add offset to center circle radius to get the total radius.
    return center + (5 + offset) * sin(radians);
  }

  @override
  void paint(Canvas canvas, Size size) {
    //Proportion Variables
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    /**
     * Calculate the positions for each hand. There are 3 main steps:
     * 1.) Calculate the radians by converting the seconds, minutes or hours to degrees.
     * 2.) Calculate the starting X and Y position for each hand on the circle near the center.
     * 3.) Calculate the ending X and Y position for each hand on the circle which is further from the center.
     */

    var secondRadians = calculateRadians(_second, 6);
    double secondStartX = calculateXCoord(centerX, 5, secondRadians);
    double secondStartY = calculateYCoord(centerY, 5, secondRadians);
    double secondEndX = calculateXCoord(centerX, 115, secondRadians);
    double secondEndY = calculateYCoord(centerY, 115, secondRadians);

    var minuteRadians = calculateRadians(_minute, 6);
    double minuteStartX = calculateXCoord(centerX, 5, minuteRadians);
    double minuteStartY = calculateYCoord(centerY, 5, minuteRadians);
    double minuteEndX = calculateXCoord(centerX, 95, minuteRadians);
    double minuteEndY = calculateYCoord(centerY, 95, minuteRadians);

    var hourRadians = calculateRadians(_hour, 30);
    double hourStartX = calculateXCoord(centerX, 5, hourRadians);
    double hourStartY = calculateYCoord(centerY, 5, hourRadians);
    double hourEndX = calculateXCoord(centerX, 55, hourRadians);
    double hourEndY = calculateYCoord(centerY, 55, hourRadians);

    /* Hands Paths */
    var secondHandPath = Path()
      ..moveTo(secondStartX, secondStartY)
      ..lineTo(secondEndX, secondEndY);

    var minuteHandPath = Path()
      ..moveTo(minuteStartX, minuteStartY)
      ..lineTo(minuteEndX, minuteEndY);

    var hourHandPath = Path()
      ..moveTo(hourStartX, hourStartY)
      ..lineTo(hourEndX, hourEndY);

    /* Hands Paint */
    var secondHandPaint = Paint() //LOL the paint is second hand O-O
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    //Minute and hour have the same color.
    var minuteAndHourHandPaint = Paint()
      ..color = _minuteAndHourHandColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    /* CANVAS PAINTING */
    //Draw Seconds Hand
    canvas.drawPath(secondHandPath, secondHandPaint);
    //Draw Minutes Hand
    canvas.drawPath(minuteHandPath, minuteAndHourHandPaint);
    //Draw Hours Hand
    canvas.drawPath(hourHandPath, minuteAndHourHandPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //Always needs to rebuild as time is constantly updated.
    return true;
  }
}
