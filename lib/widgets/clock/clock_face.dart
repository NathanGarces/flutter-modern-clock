import 'dart:math';

import 'package:flutter/material.dart';

class ClockFace extends StatelessWidget {
  final Color gradientColorOne;
  final Color gradientColorTwo;

  const ClockFace(
      {Key key,
      this.gradientColorOne = const Color(0xFF213254),
      this.gradientColorTwo = const Color(0xFF0E1027)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClockFacePainter(gradientColorOne, gradientColorTwo),
      size: Size(400, 400),
    );
  }
}

class _ClockFacePainter extends CustomPainter {
  Color _gradientColorOne;
  Color _gradientColorTwo;

  _ClockFacePainter(this._gradientColorOne, this._gradientColorTwo) : super();

  @override
  void paint(Canvas canvas, Size size) {
    //Proportion Variables
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    //Subtract 20 to leave some space between the circle and it's size sides.
    double radius = min(centerX, centerY) - 20;

    //Circle widths
    double outerCircleWidth = 30;
    double outerCircleShadowWidth = 25;

    /* Clock Face */

    //Rectangle used for the shadow and to create the shader for the gradient
    var clockFaceRect = Rect.fromCircle(center: center, radius: radius);

    /* Clock Face Ring */

    var clockFaceGradient = new LinearGradient(
        colors: [_gradientColorOne, _gradientColorTwo],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft);

    var clockFacePaint = Paint()
      ..strokeWidth = outerCircleWidth
      ..style = PaintingStyle.stroke
      ..shader = clockFaceGradient.createShader(clockFaceRect);

    /* Clock Face Shadow */

    var shadowPath = Path()..addOval(clockFaceRect);

    var shadowPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = outerCircleShadowWidth
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8);

    /* Clock Face Quarter Hour Marks */

    //The Offsets are used to get the start and end point of the line drawn on the circle.
    var startOffset = size.height * 0.01;
    var endOffset = size.height * 0.025;
    var hourLinePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.white;

    //12 - Hour Line
    var twelveHourLinePath = Path()
      ..moveTo(centerX, centerY - radius + startOffset)
      ..lineTo(centerX, centerY - radius - endOffset);

    //3 - Hour Line
    var threeHourLinePath = Path()
      ..moveTo(centerX + radius - startOffset, centerY)
      ..lineTo(centerX + radius + endOffset, centerY);

    //6 - Hour Line
    var sixHourLinePath = Path()
      ..moveTo(centerX, centerY + radius - startOffset)
      ..lineTo(centerX, centerY + radius + endOffset);

    //9 - Hour Line
    var nineHourLinePath = Path()
      ..moveTo(centerX - radius + startOffset, centerY)
      ..lineTo(centerX - radius - endOffset, centerY);

    /* CANVAS PAINTING */
    //Draw Clock Face Shadow
    canvas.drawPath(shadowPath, shadowPaint);
    //Draw Clock Face
    canvas.drawCircle(center, radius, clockFacePaint);
    //Draw Hour Quarter Marks
    canvas.drawPath(twelveHourLinePath, hourLinePaint);
    canvas.drawPath(threeHourLinePath, hourLinePaint);
    canvas.drawPath(sixHourLinePath, hourLinePaint);
    canvas.drawPath(nineHourLinePath, hourLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //The clock face will repaint if the color is changed.
    if (oldDelegate != this) {
      return true;
    } else {
      return false;
    }
  }
}
