import 'package:flutter/material.dart';
import 'package:one_word_poem/components/cards/topic_card.dart';
import 'package:one_word_poem/components/textFields/default_text_field.dart';
import 'package:one_word_poem/components/textFields/text_area.dart';

import 'painters/dashed_line_painter.dart';

class LatterBox extends StatefulWidget {
  const LatterBox({super.key});

  @override
  State<LatterBox> createState() => _LatterBoxState();
}

class _LatterBoxState extends State<LatterBox> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void submit() {
    final title = _titleController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withValues(alpha: 0.28),
            blurRadius: 8,
            spreadRadius: -20,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/textures/paper_frame_white.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 38),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox.fromSize(size: Size(10, 30)),
                    const Text(
                      '오늘의 마음을 짧은 시로 남겨보세요',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      key: Key("dot_line"),
                      padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomPaint(painter: DashedLinePainter()),
                          ),
                          const SizedBox(width: 4),
                          Image.asset(
                            'assets/articles/botanical_branch.png',
                            height: 25,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('오늘의 주제', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                    TopicCard(topic: "비 오늘날 하늘"),
                    DefaultTextField(
                      textTitle: "시 제목",
                      hintText: "제목을 적어주세요",
                      maxLength: 20,
                      controller: _titleController,
                    ),

                    TextArea(
                      textTitle: "시 쓰기",
                      hintText: "여기에 마음을 적어보세요",
                      maxLength: 120,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            left: -2,
            child: Image.asset(width: 100, 'assets/articles/tape.png'),
          ),
        ],
      ),
    );
  }
}
