import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:obamahome/app/controllers/search_controller.dart';
import 'package:obamahome/app/models/objeto_aprendizagem.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/cores_personalizadas.dart';

class OurProductItem extends StatefulWidget {
  const OurProductItem(
      {super.key,
      required this.id,
      required this.title,
      this.width = 237.5,
      this.height = 327.5});

  final int id;
  final double height;
  final double width;
  final String title;

  @override
  State<OurProductItem> createState() => _OurProductItemState();
}

final shadowHouver = [
  BoxShadow(
    color: onPrimary.withValues(alpha: 0.1),
    spreadRadius: 4.0,
    blurRadius: 4.0,
  ),
];
final shadowNoHouver = [
  const BoxShadow(
    color: Colors.transparent,
    spreadRadius: 4.0,
    blurRadius: 4.0,
  ),
];

class _OurProductItemState extends State<OurProductItem> {
  bool hover = false;
  ObjetoAprendizagem? oa;
  Widget contentItem = Container();
  Color mycolor = Colors.white;

  void addObjects(selectedOA, prefs) async {
    await prefs.setStringList('objects', selectedOA);
  }

  @override
  void initState() {
    super.initState();
    mycolor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withAlpha(1);
    contentItem = buildListItem();
  }

  Widget buildListItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.center,
              width: widget.width,
              decoration: BoxDecoration(
                color: background,
                border: hover
                    ? const Border(
                        top: BorderSide.none,
                        bottom: BorderSide.none,
                        left: BorderSide.none,
                        right: BorderSide.none,
                      )
                    : Border.all(
                        color: const Color(0xf3f3f3ff),
                        width: 20.0,
                      ),
              ),
              child: buildImage(widget.title, "${widget.id}")),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: const Color(0xf3f3f3ff),
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: textTheme.labelLarge,
                    ),
                    child: const Text('Abrir'),
                    onPressed: () async {
                      fetchOAById(widget.id).then((result) {
                        setState(() {
                          oa = result;
                        });
                        if (oa != null) {
                          final Uri url = Uri.parse(oa!.getLink());
                          launchUrl(url);
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: textTheme.labelLarge,
                    ),
                    child: const Text('Detalhes'),
                    onPressed: () async {
                      ObjetoAprendizagem OAResponse =
                          await fetchOAById(widget.id);
                      _dialogBuilder(OAResponse);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() {
        hover = true;
      }),
      onExit: (event) => setState(() {
        hover = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: background,
          boxShadow: hover ? shadowHouver : shadowNoHouver,
          border: Border(
            bottom: hover
                ? const BorderSide(
                    color: CoresPersonalizadas.azulObama,
                    width: 5.0,
                  )
                : BorderSide.none,
          ),
        ),
        child: contentItem,
      ),
    );
  }

  Widget buildImage(String text, String id) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://raw.githubusercontent.com/amandamaria/imagens-oas/refs/heads/main/${id}.png"), // Substitua pela sua imagem
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color:
                Colors.black.withValues(alpha: 0.5), // Fundo semi-transparente
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontFamily: 'SRF2', color: Colors.white, fontSize: 28),
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> _dialogBuilder(ObjetoAprendizagem? oa) async {
    return oa == null
        ? showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                    'Erro ao buscar informações sobre este Objeto de Aprendizagem.'),
                content: Container(),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: textTheme.labelLarge,
                    ),
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          )
        : showGeneralDialog<void>(
            context: context,
            pageBuilder: (x, y, z) {
              return AlertDialog(
                scrollable: true,
                title: Text(oa.nome),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text("Plataforma de uso: ${oa.getPlataforma()}",
                          style: textTheme.headlineSmall),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text("Descritores PCN",
                          style: textTheme.headlineSmall),
                    ),
                    // kIsWeb
                    //     ? FittedBox(
                    //         fit: BoxFit.fitHeight,
                    //         child: Text(oa.getDescritores()))
                    //     : 
                        Text(oa.getDescritores()),
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          "Habilidades BNCC",
                          style: textTheme.headlineSmall,
                        )),
                    // kIsWeb
                    //     ? FittedBox(
                    //         fit: BoxFit.fitHeight,
                    //         child: Text(oa.getHabilidades()))
                    //     : 
                        Text(oa.getHabilidades())
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: textTheme.labelLarge,
                    ),
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.pop(x);
                    },
                  ),
                ],
              );
            },
          );
  }
}
