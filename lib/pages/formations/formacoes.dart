import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../components/bannerSuperior.dart';
import '../../components/carousel.dart';
import '../../components/drawer.dart';
import '../../components/footer.dart';
import '../../components/navMenu.dart';
import '../../components/sectionTitle.dart';
import '../../components/topbar.dart';
import 'dropdowns_formations.dart';

class Formacoes extends StatelessWidget {
  const Formacoes({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: scaffoldKey,
        drawer: const drawermenu(),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                child: Column(children: <Widget>[
              TopBar(swidth),
              if (MediaQuery.of(context).size.width > 1360) ...[
                Container(
                    width: swidth,
                    height: 125,
                    margin: EdgeInsets.only(
                        left: swidth * 0.068, right: swidth * 0.06),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 250,
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                          NavMenu(
                              swidth: swidth,
                              eixoLista: Axis.horizontal,
                              heightBtn: 50),
                        ])),
              ] else ...[
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              child:
                                  const Icon(Icons.menu, color: Colors.black),
                              onPressed: () =>
                                  scaffoldKey.currentState?.openDrawer()),
                          Container(
                              width: 280,
                              padding:
                                  const EdgeInsets.only(right: 30, left: 30),
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                          TextButton(
                              onPressed: () {},
                              child: const Icon(Icons.search,
                                  color: Colors.black, size: 25))
                        ]))
              ],
              BannerSuperior(context, 'Formações'),
              Container(
                height: 320,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 120.0, bottom: 65.0),
                child: SectionTitle(
                    'Plataforma OBAMA',
                    'Objetos de Aprendizagem para Matemática',
                    CrossAxisAlignment.center),
              ),
              // if (MediaQuery.of(context).size.width > 1200) ...[
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ResponsiveGridCol(lg: 8, sm: 12, child: Dropdowns()),
                ),
              ),
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}

class CustomVideo extends StatelessWidget {
  final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'oH3omNV9UUU',
      params: const YoutubePlayerParams(
        autoPlay: true,
        mute: false,
      ));

  CustomVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: YoutubePlayerIFrame(
      controller: _controller,
      aspectRatio: 16 / 9,
    )));
  }
}
