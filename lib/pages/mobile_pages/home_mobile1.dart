import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/pages/formacoes.dart';
import 'package:obamahome/pages/home/home_Mobile.dart';
import 'package:obamahome/pages/mobile_pages/mobile_pages_export.dart';

import '../about-us/aboutUs.dart';

class HomeMobile1 extends StatefulWidget {
  const HomeMobile1({super.key});

  @override
  State<HomeMobile1> createState() => _HomeMobile1State();
}

final TrackingScrollController _scrollController = TrackingScrollController();
 int _indiceAbaSelecionada = 0;

final List<Widget> _telas = [
  HomeMobile(scrollController: _scrollController),
  AboutUsPage(),
  Scaffold(backgroundColor: Colors.yellow),
  Formacoes(),
  Scaffold(backgroundColor: Colors.amberAccent),
  Scaffold(backgroundColor: Colors.purple),
];

final List<Icon> _icones = [
  Icon(Icons.home, color: Colors.black, size: 30,),
  Icon(FontAwesomeIcons.faceSmile,size: 30,color: Colors.black,),//sobre nos
  Icon(FontAwesomeIcons.desktop,size: 30, color: Colors.black,), //"Planos de Aula"
  Icon(FontAwesomeIcons.book,color: Colors.black,size: 30, ), //"Trilhas"
  Icon(Icons.menu, color: Colors.black,size: 30, ),
  Icon(Icons.search, color: Colors.black,size: 30, ),
];



class _HomeMobile1State extends State<HomeMobile1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _telas.length,
      child: Scaffold(
        body: TabBarView(
        children: _telas

    ),
        bottomNavigationBar: NavegacaoEntrePaginasMobile(
          indiceAbaSelecionada: _indiceAbaSelecionada,
          icones: _icones,
          onTap: (indice){
            setState(() {
              _indiceAbaSelecionada = indice;
            });
          },
        ),


         // CurvedNavigationBar(
         //   color: CoresPersonalizadas.azulObama,
         //   buttonBackgroundColor: CoresPersonalizadas.azulObama,
         //   backgroundColor: Colors.white,
         //   animationDuration: Duration(milliseconds:250),
         //
         //     items: _icones,
         //     index: 0,
         //     onTap: (indice){
         //     setState(() {
         //        _indiceAbaSelecionada = indice;
         //
         //        Navigator.pushNamed(context, )
         //     });
         //   }
         //
         // )





      ),
    );
  }
}
