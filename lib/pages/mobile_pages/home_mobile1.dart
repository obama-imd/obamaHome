import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/components/cores_personalizadas.dart';

import '../about-us/nossa_historia.dart';
import '../home/home_Mobile.dart';

class HomeMobile1 extends StatefulWidget {
  const HomeMobile1({super.key});

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
     Icon(Icons.home, color: Colors.black, size: 30,),
     Icon(FontAwesomeIcons.faceSmile,size: 30,color: Colors.black,),//sobre nos
     Icon(FontAwesomeIcons.desktop,size: 30, color: Colors.black,), //"Planos de Aula"
     Icon(FontAwesomeIcons.book,color: Colors.black,size: 30, ), //"Trilhas"
     Icon(FontAwesomeIcons.trophy, color: Colors.black,size: 30, ),
     Icon(Icons.menu, color: Colors.black,size: 30, ),
     ];

     final List<Widget> telas = [
       HomeMobile( scrollController: _scrollController,),
       NossaHistoria(),
       Scaffold(backgroundColor: Colors.amber,),
       Scaffold(backgroundColor: Colors.purple,),
       Scaffold(backgroundColor: Colors.blue,),
       Scaffold(backgroundColor: Colors.green,),
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
          onTap: (index)=> setState(() => this.index = index),
      ),
       body: telas[index],
     );
  }
}
