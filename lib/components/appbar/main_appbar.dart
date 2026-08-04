import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key});

  static const double appBarHeight = 55;

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      automaticallyImplyLeading: false,
      centerTitle: true,
      toolbarHeight: 55,
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFBF2),
          image: DecorationImage(
            image: AssetImage('assets/textures/paper_texture_low.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: const Text(
        '오늘의 시 한 조각',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Color(0xFF493326),
          letterSpacing: 2,
        ),
      ),
    );
  }
}
