import 'package:flutter/cupertino.dart';

class LinedPaperPainter extends CustomPainter {
  const LinedPaperPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD8CBBE)
      ..strokeWidth = 1;

    const horizontalPadding = 24.0;
    const firstLineY = 57.0;
    const lineSpacing = 40.0;
    const dashWidth = 2.0;
    const dashGap = 3.0;

    for (
    double y = firstLineY;
    y < size.height - 40;
    y += lineSpacing
    ) {
      double x = horizontalPadding;

      while (x < size.width - horizontalPadding) {
        canvas.drawLine(
          Offset(x, y),
          Offset(
            (x + dashWidth).clamp(
              horizontalPadding,
              size.width - horizontalPadding,
            ),
            y,
          ),
          paint,
        );

        x += dashWidth + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant LinedPaperPainter oldDelegate) => false;
}