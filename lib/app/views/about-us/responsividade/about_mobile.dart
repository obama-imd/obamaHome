import 'package:flutter/material.dart';
import 'package:obamahome/app/views/about-us/constants.dart';
import 'package:obamahome/components/navMenu.dart';
import 'package:obamahome/utils/app_theme.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../components/bannerSuperior.dart';
import '../../../../components/carousel.dart';
import '../../../../components/drawer.dart';
import '../../../../components/footer.dart';
import '../../../../components/menuClass.dart';
import '../../../../components/menuMobile.dart';
import '../../../../components/sectionTitle.dart';
import '../../../../components/topbar.dart';
import '../../../../components/youtubePlayer.dart';
import '../../../../utils/app_padding.dart';
import '../components/staff.dart';

class AboutUsMobile extends StatelessWidget {
  const AboutUsMobile({Key? key}) : super(key: key);
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
        body: SafeArea(
          child: SingleChildScrollView(
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
                                heightBtn: 50,
                                itemValues: getItemValues(),
                                searchAvailable: true),
                          ])),
                ] else ...[
                  menuMobile(context, scaffoldKey, swidth),
                ],
                BannerSuperior(context, 'Sobre Nós'),
                Padding(
                  padding: const EdgeInsets.only(top: 120.0, bottom: 65.0),
                  child: SectionTitle(
                      'Plataforma OBAMA',
                      'Objetos de Aprendizagem para Matemática',
                      CrossAxisAlignment.center),
                ),
                // if (MediaQuery.of(context).size.width > 1200) ...[
                Column(children: [
                  Container(
                      color: const Color.fromARGB(255, 224, 220, 220),
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Padding(
                        padding: paddingValues("sideMainPadding", context),
                        child: Column(children: [
                          Text(accordionItems[0].accordionTitle,
                              style: textTheme.titleSmall),
                          Container(height: 15),
                          Text(
                            accordionItems[0].accordionContent,
                            textAlign: TextAlign.justify,
                          )
                        ]),
                      )),
                  Container(
                      decoration: const BoxDecoration(
                          color: const Color.fromARGB(255, 224, 220, 220),
                          border: Border(
                              bottom: BorderSide(
                            color: Colors.blue,
                            width: 8,
                          ))),
                      // padding: EdgeInsets.all(30),
                      child: CustomVideo(urlVideo: 'oH3omNV9UUU'))
                ]),
                Container(
                    margin: const EdgeInsets.only(top: 100),
                    padding: paddingValues("sideMainPadding", context),
                    child: Column(children: [
                      Text(accordionItems[1].accordionTitle,
                          style: textTheme.titleSmall),
                      Container(height: 15),
                      Text(
                        accordionItems[1].accordionContent,
                        textAlign: TextAlign.justify,
                      )
                    ])),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 120.0, bottom: 65.0),
                    child: SectionTitle(
                        'Coordenadores', '', CrossAxisAlignment.center),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: swidth * 0.06),
                    child: ResponsiveGridRow(children: [
                      ResponsiveGridCol(lg: 3, child: Spacer()),
                      for (int i = 0; i < LeadersTeam.length; i++) ...{
                        ResponsiveGridCol(
                            lg: 3,
                            xs: 12,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 30, left: 10, right: 10),
                              child: StaffCard(LeadersTeam[i].name, LeadersTeam[i].image, LeadersTeam[i].link, swidth),
                            ))
                      },
                      ResponsiveGridCol(lg: 3, child: Spacer()),
                    ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 65, bottom: 65.0),
                    child: SectionTitle(
                        'Colaboradores', '', CrossAxisAlignment.center),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: swidth * 0.06),
                    child: ResponsiveGridRow(children: [
                      for (int i = 0; i < StaffTeam.length; i++) ...{
                        ResponsiveGridCol(
                            lg: 3,
                            md: 6,
                            xs: 12,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 30, left: 10, right: 10),
                              child: StaffCard(StaffTeam[i].name, StaffTeam[i].image, StaffTeam[i].link, swidth),
                            ))
                      }
                    ]),
                  ),
                ]),
                Carousel(swidth),
                Footer(swidth),
              ]))),
        ));
  }
}
