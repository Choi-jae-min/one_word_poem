import 'package:flutter/material.dart';

import '../components/appbar/main_appbar.dart';
import '../components/cards/animation_card.dart';
import '../components/latter_box.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10,10,10,0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(243, 236, 219, 1.0),
          image: DecorationImage(
            image: const AssetImage('assets/textures/paper_texture_highres.png'),
            repeat: ImageRepeat.repeat
          )
        ),
        child: SafeArea(
          child: Column(
            children: [
              AnimationCard(),
              Expanded(
                child: LatterBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
