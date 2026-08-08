import 'package:flutter/material.dart';
import 'package:one_word_poem/components/footers/latter_footer.dart';

import '../components/appbar/main_appbar.dart';
import '../components/cards/animation_card.dart';
import '../components/latter_box.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(243, 236, 219, 1),
          image: DecorationImage(
            image: const AssetImage(
              'assets/textures/paper_texture_highres.png',
            ),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Column(
          children: [
            AnimationCard(),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: const [
                  Positioned(
                    top: -20,
                    right: 0,
                    bottom: -10,
                    left: 0,
                    child: LatterBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: LatterFooter(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
        },
      ),
    );
  }
}
