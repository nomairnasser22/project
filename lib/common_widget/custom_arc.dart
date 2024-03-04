import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import '../common/color_extensions.dart';

class CustomArcPainter extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double blurWidth;
  CustomArcPainter({
    this.start = 0,
    this.end = 270,
    this.width = 15,
    this.blurWidth = 6,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);
    var graidientColor = LinearGradient(colors: [
      TColor.secondary,
      TColor.secondary0,
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
    Paint activePaint = Paint()..shader = graidientColor.createShader(rect);
    activePaint.style = PaintingStyle.stroke;
    activePaint.strokeWidth = width;
    activePaint.strokeCap = StrokeCap.round;
    Paint backgroundPaint = Paint();
    backgroundPaint.color = TColor.gray70;
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = width;
    backgroundPaint.strokeCap = StrokeCap.round;
    Paint shadowPaint = Paint()
      ..color = TColor.secondary.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width + blurWidth
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);
    var startValue = 135 + start;

    canvas.drawArc(
        rect, radians(startValue), radians(270), false, backgroundPaint);

    Path path = Path();
    path.addArc(rect, radians(startValue), radians(end));
    canvas.drawPath(path, shadowPaint);

    canvas.drawArc(rect, radians(startValue), radians(end), false, activePaint);
  }

  @override
  bool shouldRepaint(CustomArcPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArcPainter oldDelegate) => false;
}
