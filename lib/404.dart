import 'package:flutter/material.dart';
import 'package:obamahome/components/menuClass.dart';

import '../../../components/bannerSuperior.dart';
import '../../../components/carousel.dart';
import '../../../components/drawer.dart';
import '../../../components/footer.dart';
import '../../../components/navMenu.dart';
import '../../../components/topbar.dart';
import '../../../utils/app_theme.dart';
import 'components/mainButton.dart';
import 'components/menuMobile.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                    constraints: BoxConstraints(maxWidth: 1200),
                    height: 125,
                    margin: EdgeInsets.only(
                        left: swidth * 0.068, right: swidth * 0.058),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 240,
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                          NavMenu(
                              swidth: swidth,
                              heightBtn: 50,
                              itemValues: itemValues,
                              searchAvailable: true),
                        ])),
              ] else ...[
                menuMobile(context, scaffoldKey, swidth),
              ],
              BannerSuperior(context, 'Erro 404'),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 750),
                            child: Container(
                              color: Color(0xFF678A8A),
                              child: Column(children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Text("404",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 60, color: background))),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Text("Oops... Página não encontrada!",
                                      textAlign: TextAlign.center,
                                      style: textTheme.displayLarge),
                                ),
                                Image.asset("assets/images/not-found.png"),
                              ]),
                            ))),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "A página que você procura foi movida, removida, renomeada ou não existe!"
                          "\nOu pode ter ocorrido uma falha na digitação do endereço;"
                          "\nOu com sua conexão de internet;"
                          "\nResumindo, algo não está certo.",
                          textAlign: TextAlign.center,
                        )),
                    mainButton(context, "Voltar".toUpperCase(), null,
                        () => Navigator.pushNamed(context, '/')),
                  ],
                ),
              ),
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}
