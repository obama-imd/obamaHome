import 'package:flutter/material.dart';
import 'package:obamahome/app/views/about-us/constants.dart';
import 'package:obamahome/templates/template_basic_col.dart';
import 'package:obamahome/utils/app_theme.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../components/sectionTitle.dart';
import '../../../../components/youtubePlayer.dart';
import '../../../../utils/app_padding.dart';
import '../components/staff.dart';

// class AboutUsDesktop extends StatelessWidget {
//   const AboutUsDesktop({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: MyStatefulWidget());
//   }
// }

class AboutUsDesktop extends StatefulWidget {
  AboutUsDesktop({Key? key}) : super(key: key);
  @override
  State<AboutUsDesktop> createState() => AboutUsDesktopState();
}

class AboutUsDesktopState extends State<AboutUsDesktop> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return TemplateColumn(children: [
      Padding(
        padding: paddingValues("sectionPadding", context),
        child: SectionTitle(
            'Plataforma OBAMA',
            'Objetos de Aprendizagem para Matemática',
            CrossAxisAlignment.center),
      ),
      // if (MediaQuery.of(context).size.width > 1200) ...[
      Container(
        constraints: BoxConstraints(maxWidth: 1200),
        color: const Color.fromARGB(255, 224, 220, 220),
        margin: paddingValues("sideMainPadding", context),
        child: ResponsiveGridRow(children: [
          ResponsiveGridCol(
            lg: 6,
            sm: 12,
            child: Container(
                padding: const EdgeInsets.all(30.0),
                height: 390,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(accordionItems[0].accordionTitle,
                          style: textTheme.titleSmall),
                      Container(height: 15),
                      Text(accordionItems[0].accordionContent,
                          textAlign: TextAlign.justify)
                    ])),
          ),
          ResponsiveGridCol(
            lg: 6,
            sm: 12,
            child: Container(
                height: 390,
                color: primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomVideo(urlVideo: 'oH3omNV9UUU'),
                  ],
                )),
          )
        ]),
      ),
      Container(
          margin: const EdgeInsets.only(top: 100),
          constraints: BoxConstraints(maxWidth: 1200),
          padding: paddingValues("sideMainPadding", context),
          child: ResponsiveGridCol(
            lg: 8,
            sm: 12,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(accordionItems[1].accordionTitle,
                  style: textTheme.titleSmall),
              Container(height: 15),
              Text(accordionItems[1].accordionContent,
                  textAlign: TextAlign.justify)
            ]),
          )),
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
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           for (int i = 0; i < grid1Title.length; i++) ...{
      //                             ResponsiveGridCol(
      //                               lg: 6,
      //                               sm: 12,
      //                               child: Padding(
      //                                 padding:
      //                                     const EdgeInsets.only(bottom: 100),
      //                                 child: Column(
      //                                     crossAxisAlignment:
      //                                         CrossAxisAlignment.start,
      //                                     children: [
      //                                       Container(
      //                                           height: 100,
      //                                           width: 100,
      //                                           decoration: BoxDecoration(
      //                                               color: CoresPersonalizadas
      //                                                   .azulObama,
      //                                               borderRadius:
      //                                                   BorderRadius.circular(
      //                                                       100)),
      //                                           child: Icon(grid1Icon[i],
      //                                               size: iconSize[i],
      //                                               color: background)),
      //                                       Container(
      //                                           padding: const EdgeInsets.only(
      //                                               top: 20),
      //                                           child: Text(grid1Title[i],
      //                                               style:
      //                                                   textTheme.titleSmall)),
      //                                       Container(
      //                                           padding: const EdgeInsets.only(
      //                                               top: 20),
      //                                           child: Text(grid1Content[i],
      //                                               style: textTheme.bodySmall))
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
      //             child:
      //                 Image.asset('assets/images/img2.jpg', fit: BoxFit.cover)),
      //       ),
      //     }
      //   ]),
      // ),
      Container(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 120.0, bottom: 65.0),
            child: SectionTitle('Coordenadores', '', CrossAxisAlignment.center),
          ),
          Padding(
            padding: paddingValues("sideStaff", context),
            child: ResponsiveGridRow(children: [
              ResponsiveGridCol(lg: 3, child: Spacer()),
              for (int i = 0; i < LeaderNames.length; i++) ...{
                ResponsiveGridCol(
                    lg: 6,
                    child: StaffCard(
                        LeaderNames[i], LeaderImgs[i], LeaderLink[i], swidth))
              },
              ResponsiveGridCol(lg: 3, child: Spacer()),
            ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 65, bottom: 65.0),
            child: SectionTitle('Colaboradores', '', CrossAxisAlignment.center),
          ),
          Padding(
            padding: paddingValues("sideStaff", context),
            child: Container(),
          ),
          ResponsiveGridRow(children: [
            for (int i = 0; i < staffNames.length; i++) ...{
              ResponsiveGridCol(
                lg: 3,
                md: 6,
                xs: 12,
                child: StaffCard(
                    staffNames[i], staffImgs[i], staffLinks[i], swidth),
              )
            }
          ])
        ]),
      )
    ]);
  }
}
