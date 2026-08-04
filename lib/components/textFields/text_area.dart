import 'package:flutter/material.dart';

import '../painters/lined_paper_painter.dart';

class TextArea extends StatefulWidget {
  final String hintText;
  final String textTitle;
  final int maxLength;

  const TextArea({super.key,
    required this.hintText,
    required this.textTitle,
    required this.maxLength,
  });

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(widget.textTitle),
          SizedBox(
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFE4D8C8),
                  width: 1.5,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: LinedPaperPainter(),
                    ),
                  ),

                  // 입력 영역
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
                    child: TextField(
                      cursorHeight: 22,
                      maxLength: widget.maxLength,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 2.5,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF493326),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF9B948C),
                        ),
                        counterStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6E6257),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
