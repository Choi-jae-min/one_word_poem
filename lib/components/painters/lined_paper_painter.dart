import 'package:flutter/cupertino.dart';

class LinedPaperPainter extends CustomPainter {
  LinedPaperPainter({
    required this.firstLineY,
    required this.lineSpacing,
    required this.scrollController,
  }) : super(repaint: scrollController);

  final double firstLineY;
  final double lineSpacing;
  final ScrollController scrollController;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD8CBBE)
      ..strokeWidth = 1;

    const horizontalPadding = 24.0;
    const dashWidth = 2.0;
    const dashGap = 3.0;

    final scrollOffset = scrollController.hasClients
        ? scrollController.offset
        : 0.0;
    final firstVisibleLineY = firstLineY - (scrollOffset % lineSpacing);

    for (double y = firstVisibleLineY; y < size.height - 40; y += lineSpacing) {
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
  bool shouldRepaint(covariant LinedPaperPainter oldDelegate) {
    return firstLineY != oldDelegate.firstLineY ||
        lineSpacing != oldDelegate.lineSpacing ||
        scrollController != oldDelegate.scrollController;
  }
}
