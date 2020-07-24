import 'package:flutter/material.dart';
import 'package:flutter_modern_clock/widgets/clock/clock_centre_circle.dart';
import 'package:flutter_modern_clock/widgets/clock/clock_face.dart';

class Clock extends StatelessWidget {
  final double size;

  const Clock({Key key, this.size = 400}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      color: Colors.red,
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
        ],
      ),
    );
  }
}
