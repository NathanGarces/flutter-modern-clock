import 'package:flutter/material.dart';
import 'package:flutter_modern_clock/widgets/clock/clock_centre_circle.dart';
import 'package:flutter_modern_clock/widgets/clock/clock_face.dart';
import 'package:flutter_modern_clock/widgets/clock/clock_hands.dart';

class Clock extends StatelessWidget {
  final double size;
  final double second;
  final double minute;
  final double hour;

  const Clock(
      {Key key,
      this.size = 400,
      @required this.second,
      @required this.minute,
      @required this.hour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ClockFace(),
          ),
          Align(
            alignment: Alignment.center,
            child: ClockCentreCircle(),
          ),
          Align(
            alignment: Alignment.center,
            child: ClockHands(
              second: second,
              minute: minute,
              hour: hour,
            ),
          ),
        ],
      ),
    );
  }
}
