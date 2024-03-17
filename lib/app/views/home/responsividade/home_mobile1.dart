import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/utils/cores_personalizadas.dart';

// import '../about-us/nossa_historia.dart';
import '../../../../utils/app_theme.dart';

class HomeMobile1 extends StatefulWidget {
  final void hidePosts;

  const HomeMobile1({
    Key? key,
    required this.hidePosts
  }) : super(key: key);

  @override
  State<HomeMobile1> createState() => _HomeMobile1State();
}

class _HomeMobile1State extends State<HomeMobile1> {

  final TrackingScrollController _scrollController = TrackingScrollController();
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      Icon(
        Icons.home,
        color: onPrimary,
        size: 30,
      ),
      Icon(
        FontAwesomeIcons.faceSmile,
        size: 30,
        color: onPrimary,
      ), //sobre nos
      Icon(
        FontAwesomeIcons.desktop,
        size: 30,
        color: onPrimary,
      ), //"Planos de Aula"
      Icon(
        FontAwesomeIcons.book,
        color: onPrimary,
        size: 30,
      ), //"Trilhas"
      Icon(
        FontAwesomeIcons.trophy,
        color: onPrimary,
        size: 30,
      ),
      Icon(
        Icons.menu,
        color: onPrimary,
        size: 30,
      ),
    ];

    final List<Widget> telas = [
      // HomeMobile(
      //     scrollController: _scrollController),
      // //  NossaHistoria(),
      Scaffold(
        backgroundColor: Colors.amber,
      ),
      Scaffold(
        backgroundColor: Colors.purple,
      ),
      Scaffold(
        backgroundColor: Colors.blue,
      ),
      Scaffold(
        backgroundColor: Colors.green,
      ),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: CoresPersonalizadas.azulObama,
      bottomNavigationBar: CurvedNavigationBar(
        color: CoresPersonalizadas.azulObama,
        animationDuration: Duration(milliseconds: 300),
        key: navigationKey,
        backgroundColor: Colors.transparent,
        height: 70,
        items: items,
        index: index,
        onTap: (index) => setState(() => this.index = index),
      ),
      body: telas[index],
    );
  }
}
