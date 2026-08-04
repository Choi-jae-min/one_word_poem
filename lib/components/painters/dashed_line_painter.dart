import 'package:flutter/cupertino.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFbbb39d)
      ..strokeWidth = 0.7
      ..strokeCap = StrokeCap.round;

    const dashWidth = 6.0;
    const dashSpace = 5.0;

    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(
          (startX + dashWidth).clamp(0, size.width),
          0,
        ),
        paint,
      );

      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(DashedLinePainter oldDelegate) => false;
}