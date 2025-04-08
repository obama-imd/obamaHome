import 'package:flutter/material.dart';
import 'package:obamahome/app/views/about-us/constants.dart';
import 'package:obamahome/components/navMenu.dart';
import 'package:obamahome/utils/app_padding.dart';
import 'package:obamahome/utils/app_theme.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../components/carousel.dart';
import '../../../../components/drawer.dart';
import '../../../../components/footer.dart';
import '../../../../components/menuClass.dart';
import '../../../../components/menuMobile.dart';
import '../../../../components/sectionTitle.dart';
import '../../../../components/topbar.dart';
import '../../../../components/youtubePlayer.dart';
import '../components/staff.dart';

class AboutUsTablet extends StatelessWidget {
  const AboutUsTablet({Key? key}) : super(key: key);
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
                              heightBtn: 50,
                              itemValues: getItemValues(),
                              searchAvailable: true),
                        ])),
              ] else ...[
                menuMobile(context, scaffoldKey, swidth),
              ],
              Padding(
                padding: const EdgeInsets.only(top: 120.0, bottom: 65.0),
                child: SectionTitle(
                    'Plataforma OBAMA',
                    'Objetos de Aprendizagem para Matemática',
                    CrossAxisAlignment.center),
              ),
              // if (MediaQuery.of(context).size.width > 1200) ...[
              Container(
                padding: paddingValues("sideMainPadding", context),
                child: Column(children: [
                  Container(
                      color: const Color.fromARGB(255, 224, 220, 220),
                      padding: const EdgeInsets.all(30.0),
                      child: Column(children: [
                        Text(accordionItems[0].accordionTitle,
                            style: textTheme.titleSmall),
                        Container(height: 15),
                        Text(
                          accordionItems[0].accordionContent,
                          textAlign: TextAlign.justify,
                        )
                      ])),
                  Container(
                      decoration: const BoxDecoration(
                          color: const Color.fromARGB(255, 224, 220, 220),
                          border: Border(
                              bottom: BorderSide(
                            color: Colors.blue,
                            width: 8,
                          ))),
                      padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                      child: CustomVideo(urlVideo: 'oH3omNV9UUU'))
                ]),
              ),
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
              // Padding(
              //   padding: const EdgeInsets.only(top: 100),
              //   child: ResponsiveGridRow(children: [
              //     ResponsiveGridCol(
              //       lg: 8,
              //       sm: 12,
              //       child: Container(
              //           color: const Color.fromARGB(255, 241, 238, 238),
              //           padding: const EdgeInsets.only(top: 110, left: 90),
              //           child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 SectionTitle(
              //                     'Serviços Oferecidos',
              //                     'Easy and effective way to get your device repaired.',
              //                     CrossAxisAlignment.start),
              //                 Container(
              //                     padding: const EdgeInsets.only(top: 60),
              //                     child: ResponsiveGridRow(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: [
              //                           for (int i = 0;
              //                               i < grid1Title.length;
              //                               i++) ...{
              //                             ResponsiveGridCol(
              //                               lg: 6,
              //                               sm: 12,
              //                               child: Padding(
              //                                 padding: const EdgeInsets.only(
              //                                     bottom: 100),
              //                                 child: Column(
              //                                     crossAxisAlignment:
              //                                         CrossAxisAlignment.start,
              //                                     children: [
              //                                       Container(
              //                                           height: 100,
              //                                           width: 100,
              //                                           decoration: BoxDecoration(
              //                                               color:
              //                                                   CoresPersonalizadas
              //                                                       .azulObama,
              //                                               borderRadius:
              //                                                   BorderRadius
              //                                                       .circular(
              //                                                           100)),
              //                                           child: Icon(
              //                                               grid1Icon[i],
              //                                               size: iconSize[i],
              //                                               color: background)),
              //                                       Container(
              //                                           padding:
              //                                               const EdgeInsets
              //                                                   .only(top: 20),
              //                                           child: Text(
              //                                               grid1Title[i],
              //                                               style: textTheme
              //                                                   .titleSmall)),
              //                                       Container(
              //                                           padding:
              //                                               const EdgeInsets
              //                                                   .only(top: 20),
              //                                           child: Text(
              //                                               grid1Content[i],
              //                                               style: textTheme
              //                                                   .bodySmall))
              //                                     ]),
              //                               ),
              //                             ),
              //                           },
              //                         ]))
              //               ])),
              //     ),
              //     if (swidth > 992) ...{
              //       ResponsiveGridCol(
              //         lg: 4,
              //         child: SizedBox(
              //             height: 865,
              //             child: Image.asset('assets/images/img2.jpg',
              //                 fit: BoxFit.cover)),
              //       ),
              //     }
              //   ]),
              // ),
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
                            child: StaffCard(LeadersTeam[i].name, LeadersTeam[i].image,
                                LeadersTeam[i].link, swidth),
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
                            child: StaffCard(StaffTeam[i].name, StaffTeam[i].image,
                                StaffTeam[i].link, swidth),
                          ))
                    }
                  ]),
                ),
              ]),
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}
