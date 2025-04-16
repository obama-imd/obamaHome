import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/app/views/home/responsividade/home_desktop.dart';
import 'package:obamahome/app/views/home/responsividade/home_tablet.dart';
import 'package:obamahome/utils/responsivo.dart';

import '../../../components/sectionTitle.dart';
import '../../../utils/app_padding.dart';
import 'responsividade/home_Mobile.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool loadPosts = false;
  bool loadObjects = false;

  @override
  void initState() {
    super.initState();
    // activateLoad();
    // waitData(ref);
  }

  // void activateLoad() {
  //   setState(() {
  //     loadPosts = true;
  //     loadObjects = true;
  //   });
  // }

  // void waitData(ref) {
  //   Future.wait([fetchObjects(ref)])
  //       .timeout(Duration(seconds: 5))
  //       .whenComplete(
  //         () => setState(
  //           () {
  //             loadPosts = false;
  //             loadObjects = false;
  //           },
  //         ),
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Responsivo(
              // mobile: HomeMobile1(),
              mobile: HomeMobile(
                scrollController: _scrollController,
              ),
              tablet: HomeTablet(
                scrollController: _scrollController,
              ),
              desktop: HomeDesktop(
                scrollController: _scrollController,
              ),
            ),
            // if (loadPosts || loadObjects) ...{circleLoadSpinner(context)}
          ],
        ),
      ),
    );
  }
}

class LearningLevelsHome {
  final String picture;
  final String title;
  final String text;
  final String path;
  final Color color;

  LearningLevelsHome(
      {required this.picture,
      required this.title,
      required this.text,
      required this.color,
      required this.path});
}

class OAHome extends ConsumerStatefulWidget {
  final double swidth;
  const OAHome(this.swidth, {super.key});

  @override
  OAHomeState createState() => OAHomeState();
}

class OAHomeState extends ConsumerState<OAHome> {
  Key key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        constraints: BoxConstraints(maxWidth: 1200),
        padding: paddingValues("sideHomePosts", context),
        child: Column(
          children: [
            Padding(
              padding: paddingValues("mainTitleBottom", context),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: widget.swidth * .016),
                    child: SectionTitle(
                        'Objetos de Aprendizagem',
                        'Recursos digitais classificados com base nas habilidades da BNCC e descritores dos PCN.', //WIdget que monta o título das seções
                        CrossAxisAlignment.start),
                  ),
                ],
              ),
            ),
            // ResponsiveGridList(
            //     physics: NeverScrollableScrollPhysics(),
            //     scroll: false,
            //     desiredItemWidth: 237.5,
            //     minSpacing: widget.swidth * .016,
            //     children: levels.map((post) {
            //       //Loop que opera em cima da lista de dados recebidos
            //       return Container(
            //         alignment: Alignment(0, 0),
            //         child: Row(
            //           children: [
            //             Center(
            //               // card 1
            //               child: Card(
            //                 color: Colors.white,
            //                 child: SizedBox(
            //                   width: 250,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(10.0),
            //                     child: Column(
            //                       children: [
            //                         CircleAvatar(
            //                           backgroundColor: post.color,
            //                           radius: 33,
            //                           child: CircleAvatar(
            //                             backgroundColor: background,
            //                             child: SizedBox(
            //                                 width: 46,
            //                                 height: 46,
            //                                 child: Image.asset(post.picture)),
            //                             radius: 30,
            //                           ),
            //                         ),
            //                         const SizedBox(
            //                           // espaço entre o icon e o titulo
            //                           height: 20,
            //                         ),
            //                         SizedBox(
            //                           height: 60,
            //                           child: Text(
            //                             post.title,
            //                             textAlign: TextAlign.center,
            //                             style: TextStyle(
            //                               fontWeight: FontWeight.bold,
            //                               fontSize: 18,
            //                               color: Colors.black,
            //                             ),
            //                           ),
            //                         ),
            //                         const SizedBox(
            //                           // espaço entre o titulo e o texto
            //                           height: 5,
            //                         ),
            //                         Text(
            //                           post.text,
            //                           textAlign: TextAlign.center,
            //                           style: TextStyle(
            //                             fontSize: 16,
            //                             color: secondary,
            //                           ),
            //                         ),
            //                         const SizedBox(
            //                           // espaço entre o texto e o botão
            //                           height: 20,
            //                         ),
            //                         Padding(
            //                           padding:
            //                               const EdgeInsets.only(bottom: 20.0),
            //                           child: SizedBox(
            //                             width: 101,
            //                             child: TextButton(
            //                               onPressed: () => 'Null',
            //                               child: Padding(
            //                                 padding: const EdgeInsets.all(5),
            //                                 child: Row(
            //                                   children: const [
            //                                     Text(
            //                                       'Leia mais >',
            //                                       style: TextStyle(
            //                                         color: background,
            //                                       ),
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     }).toList()),
          ],
        ),
      )
    ]);
  }
}

// fim
// class BlogHome extends ConsumerStatefulWidget {
//   final double swidth;
//   const BlogHome(this.swidth, {super.key});

//   @override
//   BlogHomeState createState() => BlogHomeState();
// }

// class BlogHomeState extends ConsumerState<BlogHome> {
//   @override
//   Widget build(BuildContext context) {
//     double imageWidth = widget.swidth * .3;
//     double imageHeight = 185;

//     return FutureBuilder(
//       future: fetchPosts(ref),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           final blogList = ref.watch(blogPostsHome);
//           List<BlogModel?> posts = [...blogList];
//           return Container(
//             constraints: BoxConstraints(maxWidth: 1200),
//             padding: EdgeInsets.symmetric(horizontal: widget.swidth * .057),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (posts.isNotEmpty) ...{
//                   Padding(
//                     padding: paddingValues("mainTitle", context),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: widget.swidth * .01),
//                           child: SectionTitle('Últimos posts do blog', '',
//                               CrossAxisAlignment.start),
//                         ),
//                       ],
//                     ),
//                   ),
//                   ResponsiveGridRow(
//                     children: [
//                       for (var item in posts) ...{
//                         ResponsiveGridCol(
//                           lg: 4,
//                           md: 8,
//                           sm: 12,
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: widget.swidth * .01),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Image.network(item!.imagePath,
//                                 //     height: imageHeight,
//                                 //     width: imageWidth,
//                                 //     fit: BoxFit.cover),
//                                 Padding(
//                                   padding:
//                                       paddingValues("blogPostDate", context),
//                                   child: Row(
//                                     children: [
//                                       const Icon(Icons.access_time, size: 16),
//                                       Text(item!.year),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   margin:
//                                       paddingValues("blogHomeTitle", context),
//                                   child: Text(item.title,
//                                       style: textTheme.titleSmall!),
//                                 ),
//                                 Text(item.summary, maxLines: 4),
//                               ],
//                             ),
//                           ),
//                         ),
//                       }
//                     ],
//                   ),
//                 } else
//                   ...{}
//               ],
//             ),
//           );
//         } else if (snapshot.hasError) {
//           Container(
//             padding: const EdgeInsets.only(top: 100, left: 90, right: 15),
//             width: widget.swidth,
//             child: Text(
//               "Perdão, tivemos um problema, tente mais tarde.",
//             ),
//           );
//         }
//         return circleLoadSpinner(context);
//       },
//     );
//   }
// }
