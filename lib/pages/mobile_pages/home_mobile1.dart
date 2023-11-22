import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeMobile1 extends StatefulWidget {
  const HomeMobile1({super.key});

  @override
  State<HomeMobile1> createState() => _HomeMobile1State();
}

final List<Widget> _telas = [
  Scaffold(backgroundColor: Colors.lightBlue),
  Scaffold(backgroundColor: Colors.green),
  Scaffold(backgroundColor: Colors.yellow),
  Scaffold(backgroundColor: Colors.pink),
];

class _HomeMobile1State extends State<HomeMobile1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:_telas.length,
      child: Scaffold(

       bottomNavigationBar: CurvedNavigationBar(
         index: 0,
         items: [
           Icon(Icons.menu),
           Icon(Icons.home),
           Icon(FontAwesomeIcons.faceSmile,), //"OAs"
           Icon(FontAwesomeIcons.desktop,), //"Planos de Aula"
           Icon(FontAwesomeIcons.windows,), //"Trilhas"
           Icon(Icons.search),
         ],


         onTap: (indice){},
         animationDuration: Duration(milliseconds: 300),
       ),
      ),
    );
  }
}
