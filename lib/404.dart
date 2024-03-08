import 'package:flutter/material.dart';

import '../../../components/bannerSuperior.dart';
import '../../../components/carousel.dart';
import '../../../components/drawer.dart';
import '../../../components/footer.dart';
import '../../../components/navMenu.dart';
import '../../../components/topbar.dart';
import '../../../utils/app_theme.dart';
import 'components/mainButton.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    returnPage() {
      Navigator.pop(context);
    };

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
                          NavMenu(swidth: swidth, heightBtn: 50),
                        ])),
              ] else ...[
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              child: const Icon(Icons.menu, color: onPrimary),
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
                                  color: onPrimary, size: 25))
                        ]))
              ],
              BannerSuperior(context, 'Erro 404'),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: ConstrainedBox( constraints: BoxConstraints(maxWidth: 750), child: Image.asset("assets/images/not-found.png"))),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                            "A página que você procura foi movida, removida, renomeada ou não existe!"
                            "\nOu pode ter ocorrido uma falha na digitação do endereço;"
                            "\nOu com sua conexão de internet;"
                            "\nResumindo, algo não está certo.", textAlign: TextAlign.center,)),
                    mainButton(context, "Voltar", null, returnPage()),
                  ],
                ),
              ),
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}
