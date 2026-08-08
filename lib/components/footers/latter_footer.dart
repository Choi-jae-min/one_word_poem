import 'package:flutter/material.dart';

import '../buttons/color_button.dart';
import '../buttons/default_button.dart';
class LatterFooter extends StatelessWidget {
  const LatterFooter({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    const menuHeight = 70.0;
    const footerBackgroundColor = Color.fromRGBO(250, 240, 230, 1);

    return SizedBox(
      width: double.infinity,
      height: menuHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 풋터 종이 본체
          Positioned.fill(
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: footerBackgroundColor,
              ),
            ),
          ),
          // 메뉴
          Positioned(
            left: 0,
            right: 0,
            top: 5,
            bottom: 0,
            child: SafeArea(
              top: false,
              minimum: const EdgeInsets.only(bottom: 8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    DefaultButton(
                      title: "예시 보기",
                      onPressed: () => {print("예시 보기")},
                    ),
                    const SizedBox(width: 12),
                    ColorButton(
                      title: "저장 하기",
                      themeColor: const Color(0xFFD86632),
                      onPressed: () => {print("저장하기")},
                    ),
                    const SizedBox(width: 120),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -7,
            right: 0,
            bottom: 7,
            child: SizedBox(
              width: 120,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  // 고양이의 투명 윤곽을 따라 푸터 배경색을 확장한다.
                  Transform.scale(
                    scale: 1.13,
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        footerBackgroundColor,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset(
                        'assets/animations/tail_cat.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/animations/tail_cat.webp',
                    fit: BoxFit.cover,
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
