import 'package:flutter/material.dart';
import 'package:one_word_poem/pages/index_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '오늘의 시 한 조각',
      theme: ThemeData(
        fontFamily: 'KyoboHand2025',
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: IndexPage(),
    );
  }
}
