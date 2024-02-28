import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/components/cores_personalizadas.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../constants.dart';

class Dropdowns extends StatelessWidget {
  const Dropdowns({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemplo de inicialização da lista de AccordionItem
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Column(children: [
        for (var lista in accordionContent) ...{
          ExpansionTile(
              title: Row(children: [
                SizedBox(height: 30, width: 2),
                Icon(FontAwesomeIcons.chartColumn, size: 19),
                SizedBox(height: 30, width: 10),
                Text(lista.accordionTitle,
                    style: TextStyle(color: Colors.black)),
              ]),
              children: [
                ListTile(
                  title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width * .45,
                        height: 450,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(lista.sectionTitle,
                                  style: TextStyle(
                                      height: 1.4, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(lista.firstParagraph,
                                  style: TextStyle(height: 1.4)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(lista.secondParagraph,
                                  style: TextStyle(height: 1.4)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: [
                                  Text("Duração da Formação: ",
                                      style: TextStyle(
                                          height: 1.4, fontWeight: FontWeight.bold)),
                                  Text(lista.duration, style: TextStyle(height: 1.4)),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(border: Border(left: BorderSide(width: 5, color: CoresPersonalizadas.azulObama))),
                              child: Text(lista.thirdParagraph,
                                  style: TextStyle(height: 1.4)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width *.4,
                        height: 450,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text('Vídeo de apresentação',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                                height: 300,
                                child: Container(
                                    child: CustomVideo(urlVideo: lista.urlVideo)))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
          SizedBox(height: 20, width: 10),
        },
      ]),
    );
  }
}

class CustomVideo extends StatelessWidget {
  final String urlVideo;

  CustomVideo({Key? key, required this.urlVideo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: urlVideo,
      params: const YoutubePlayerParams(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      body: Center(
        child: YoutubePlayerIFrame(
          controller: _controller,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
