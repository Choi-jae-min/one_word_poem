import 'package:flutter/material.dart';

class TopicCard extends StatefulWidget {
  final String topic;

  const TopicCard({super.key, required this.topic});

  @override
  State<TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _fallAnimation;
  late final Animation<double> _rotateAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    // 포스트잇이 아래로 떨어지는 거리
    _fallAnimation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCubic,
      ),
    );

    // 떨어지면서 살짝 회전
    _rotateAnimation = Tween<double>(
      begin: 0,
      end: 0.18,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // 애니메이션 후반에 사라짐
    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.55,
          1,
          curve: Curves.easeOut,
        ),
      ),
    );
  }

  void _revealTopic() {
    if (!_controller.isAnimating &&
        !_controller.isCompleted) {
      _controller.forward();
    }
  }

  void _coverTopic() {
    if (!_controller.isAnimating) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        height: 105,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _coverTopic,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: -10,
                        right: -10,
                        bottom: 3,
                        child: Container(
                          height: 9,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE6A8).withValues(alpha: 1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      Text(
                        widget.topic,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF493326),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned.fill(child: AnimatedBuilder(
                animation: _controller,
                child : GestureDetector(
                  onTap: _revealTopic,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/articles/topic_cover_postit.png',
                        fit: BoxFit.fill,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '톡 눌러 주제를 확인해보세요',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF493326),
                              ),
                            ),
                            SizedBox.fromSize(size: Size.fromWidth(10)),
                            Transform.translate(
                              offset: const Offset(0, 4),
                              child: Image.asset(
                                'assets/articles/tap_gesture_icon.png',
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              builder: (context, child) {
                  return IgnorePointer(
                      ignoring: _controller.isCompleted,
                      child : Opacity(
                        opacity: _fadeAnimation.value,
                        child: Transform.translate(
                            offset: Offset(
                              _fallAnimation.value * 0.08,
                              _fallAnimation.value,
                            ),
                          child: Transform.rotate(angle: _rotateAnimation.value,alignment: Alignment.topCenter,child: child,),
                        ),
                      )
                  );
              },
            ))
          ],
        ),
      ),
    );
  }
}
