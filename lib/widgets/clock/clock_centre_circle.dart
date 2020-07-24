import 'package:flutter/material.dart';

class ClockCentreCircle extends StatelessWidget {
  const ClockCentreCircle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClockCentreCirclePainter(),
      size: Size(400, 400),
    );
  }
}

class _ClockCentreCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Proportion Variables
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    //Circle widths
    double centreCircleRadius = 5;

    /* Clock Centre Circle */
    /* Centre Circle */
    var clockCircleCentrePaint = Paint()..color = Colors.white;

    /* Centre Circle Shadow */
    var clockCentreRect =
        Rect.fromCircle(center: center, radius: centreCircleRadius);
    var centreCircleShadowPath = Path()..addOval(clockCentreRect);
    var centreCircleShadowPaint = Paint()
      ..color = Color(0xFF000000).withOpacity(0.6)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8);

    /* CANVAS PAINTING */
    //Draw Centre Circle Shadow
    canvas.drawPath(centreCircleShadowPath, centreCircleShadowPaint);
    //Draw Centre Circle
    canvas.drawCircle(center, centreCircleRadius + 1, clockCircleCentrePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
