import 'package:flutter/material.dart';

class AnimationCard extends StatefulWidget {
  const AnimationCard({super.key});

  @override
  State<AnimationCard> createState() => _AnimationCardState();
}

class _AnimationCardState extends State<AnimationCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/animations/hari.webp',
            fit: BoxFit.contain,
          ),
          const Positioned(
            top: 0,
            child: Text(
              '오늘의 친구',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF87937B),
              ),
            ),
          ),
          const Positioned(
            bottom: 27,
            child: Text(
              '하리',
              style: TextStyle(
                fontFamily: "BMJUA_ttf",
                fontSize: 20,
                color: Color(0xFF493326),
              ),
            ),
          )
        ],
      ),
    );
  }
}
