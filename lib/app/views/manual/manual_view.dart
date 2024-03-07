import 'package:flutter/material.dart';
import 'package:obamahome/app/views/manual/constants.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../components/bannerSuperior.dart';
import '../../../components/carousel.dart';
import '../../../components/drawer.dart';
import '../../../components/dropdown_with_video.dart';
import '../../../components/footer.dart';
import '../../../components/navMenu.dart';
import '../../../components/sectionTitle.dart';
import '../../../components/topbar.dart';
import '../../../utils/app_theme.dart';

class ManuaisPage extends StatelessWidget {
  const ManuaisPage({super.key});
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
  
  var item = 0;

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
                                  const Icon(Icons.menu, color: primary),
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
                                  color: primary, size: 25))
                        ]))
              ],
              BannerSuperior(context, 'Manuais'),
              Padding(
                padding: const EdgeInsets.only(top: 120.0, bottom: 65.0),
                child: SectionTitle(
                    'Plataforma OBAMA',
                    'Objetos de Aprendizagem para Matemática',
                    CrossAxisAlignment.center),
              ),
              if (MediaQuery.of(context).size.width > 1200) ...[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ResponsiveGridCol(
                      lg: 8, sm: 12, child: DropdownManuais(accordionContent: manualItems)),
                ),
                Carousel(swidth),
                Footer(swidth),
              ]
            ]))));
  }
}
