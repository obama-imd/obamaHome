// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:obamahome/app/controllers/blog_controller.dart';
// import 'package:obamahome/app/views/blog/components/blog-details.dart';

// import '../../../../utils/app_theme.dart';

// List<String> titleCategories = [
//   'Text',
//   'Text',
//   'Text',
//   'Text',
//   'Text',
// ];

// @override
// Widget blogFilters(
//   BuildContext context,
//   double swidth,
//   List<dynamic> datas,
//   bool dataAvailable,
//   Function(List<dynamic>) updateData,
// ) {
//   bool isHover = false;
//   return Padding(
//     padding: EdgeInsets.only(right: swidth * 0.068),
//     child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//       Container(
//           alignment: Alignment.centerLeft,
//           margin: const EdgeInsets.only(bottom: 30),
//           child: Text('BUSCA', style: textTheme.titleSmall)),
//       Container(
//           height: 50,
//           margin: const EdgeInsets.only(bottom: 50),
//           child: TextField(
//               onSubmitted: (value) async {
//                 final postsFiltrados = await fetchData(value);
//                 // print(postsFiltrados);
//                 updateData(postsFiltrados);
//               },
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(100)),
//                   hintText: 'Buscar',
//                   hintStyle: textTheme.bodySmall,
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 15),
//                   filled: true,
//                   fillColor: const Color.fromARGB(255, 218, 216, 216),
//                   suffixIcon: const Icon(Icons.search)))),
//       Container(
//           alignment: Alignment.centerLeft,
//           margin: const EdgeInsets.only(bottom: 20),
//           child: Text('ABOUT AUTHOR', style: textTheme.titleSmall)),
//       Container(
//           alignment: Alignment.centerLeft,
//           margin: const EdgeInsets.only(bottom: 50),
//           child: Text(
//             'Texto',
//           )),
//       Container(
//           alignment: Alignment.centerLeft,
//           margin: const EdgeInsets.only(bottom: 20),
//           child: Text('ÚLTIMOS POSTS', style: textTheme.titleSmall)),
//       if (datas.isNotEmpty) ...{
//         SizedBox(
//           height: 80 * datas.length.toDouble(),
//           child: ListView.builder(
//             itemCount: datas.length,
//             itemBuilder: (BuildContext context, int index) {
//               final item = datas[index];

//               String pubDate = item['published_date'];
//               DateTime dateTime = DateTime.parse(pubDate);
//               String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
//               return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               BlogDetails(initialPageIndex: index)));
//                 },
//                 child: SizedBox(
//                     width: swidth * 0.29,
//                     height: 70,
//                     child: Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Column(children: [
//                         SizedBox(
//                             width: swidth * 0.29,
//                             height: 20,
//                             child: Text(item['title'],
//                                 style: textTheme.headlineSmall)),
//                         Container(
//                             width: swidth * 0.29,
//                             height: 20,
//                             margin: const EdgeInsets.only(top: 10),
//                             child: Row(children: [
//                               const Icon(FontAwesomeIcons.calendarDays,
//                                   color: onPrimary, size: 15),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 2, top: 1.5),
//                                 child: Text(
//                                   formattedDate,
//                                 ),
//                               )
//                             ])),
//                       ]),
//                     )),
//               );
//             },
//           ),
//         ),
//       } else ...{
//         Container(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               'Sem posts',
//             )),
//       },
//       Container(
//           alignment: Alignment.centerLeft,
//           margin: EdgeInsets.only(top: 50, bottom: 20, right: swidth * 0.07),
//           child: Text('CATEGORIES', style: textTheme.titleSmall)),
//       Column(mainAxisSize: MainAxisSize.max, children: [
//         for (var title in titleCategories) ...{
//           Padding(
//               padding: EdgeInsets.only(bottom: 3),
//               child: Material(
//                 color: const Color.fromARGB(255, 231, 228, 228),
//                 child: InkWell(
//                     hoverColor: primary,
//                     onTap: () {},
//                     child: Container(
//                       height: 46,
//                       alignment: Alignment.centerLeft,
//                       padding: EdgeInsets.symmetric(horizontal: 15),
//                       child: Row(children: [
//                         Icon(Icons.arrow_right,
//                             color: isHover ? background : onPrimary),
//                         Text(title,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: isHover ? background : onPrimary))
//                       ]),
//                     )),
//               )),
//         }
//       ]),
//     ]),
//   );
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/app/controllers/blog_controller.dart';
import 'package:obamahome/app/models/blog_models.dart';
import 'package:obamahome/app/views/blog/components/blog-details.dart';

import '../../../../utils/app_theme.dart';

List<String> titleCategories = [
  'Text',
  'Text',
  'Text',
  'Text',
  'Text',
];

@override
Widget blogFilters(
  BuildContext context,
  double swidth,
  List<BlogModel?> datas,
  bool dataAvailable,
  Function(List<dynamic>) updateData,
) {
  bool isHover = false;
  // print(" aqui, OTÀRIO => ${datas.length}");
  return Padding(
    padding: EdgeInsets.only(right: swidth * 0.068),
    child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 30),
          child: Text('BUSCA', style: textTheme.titleSmall)),
      Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 50),
          child: TextField(
              onSubmitted: (value) async {
                final postsFiltrados = await fetchData(value);
                // print(postsFiltrados);
                updateData(postsFiltrados);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100)),
                  hintText: 'Buscar',
                  hintStyle: textTheme.bodySmall,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 218, 216, 216),
                  suffixIcon: const Icon(Icons.search)))),
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 20),
          child: Text('ABOUT AUTHOR', style: textTheme.titleSmall)),
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 50),
          child: Text(
            'Texto',
          )),
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 20),
          child: Text('ÚLTIMOS POSTS', style: textTheme.titleSmall)),
      // if (datas.isNotEmpty) ...{
        SizedBox(
          height: 80 * datas.length.toDouble(),
          child: ListView.builder(
            itemCount: datas.length,
            itemBuilder: (BuildContext context, int index) {
              final item = datas[index];

              // String pubDate = item.publishedDate;
              // DateTime dateTime = DateTime.parse(pubDate);
              // String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BlogDetails(initialPageIndex: index)));
                },
                child: SizedBox(
                    width: swidth * 0.29,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        SizedBox(
                            width: swidth * 0.29,
                            height: 20,
                            child: Text(item!.title,
                                style: textTheme.headlineSmall)),
                        Container(
                            width: swidth * 0.29,
                            height: 20,
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(children: [
                              const Icon(FontAwesomeIcons.calendarDays,
                                  color: onPrimary, size: 15),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 2, top: 1.5),
                                child: Text(
                                  item.publishedDate,
                                ),
                              )
                            ])),
                      ]),
                    )),
              );
            },
          ),
        ),
      // } else ...{
      //   Container(
      //       alignment: Alignment.centerLeft,
      //       child: Text(
      //         'Sem posts',
      //       )),
      // },
      Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 50, bottom: 20, right: swidth * 0.07),
          child: Text('CATEGORIES', style: textTheme.titleSmall)),
      Column(mainAxisSize: MainAxisSize.max, children: [
        for (var title in titleCategories) ...{
          Padding(
              padding: EdgeInsets.only(bottom: 3),
              child: Material(
                color: const Color.fromARGB(255, 231, 228, 228),
                child: InkWell(
                    hoverColor: primary,
                    onTap: () {
                      print(datas);
                    },
                    child: Container(
                      height: 46,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        Icon(Icons.arrow_right,
                            color: isHover ? background : onPrimary),
                        Text(title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: isHover ? background : onPrimary))
                      ]),
                    )),
              )),
        }
      ]),
    ]),
  );
}
