// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:image_network/image_network.dart';
// import 'package:obamahome/app/views/blog/components/blog-filters.dart';
// import 'package:obamahome/components/bannerSuperior.dart';
// import 'package:obamahome/components/drawer.dart';

// import '../../../components/carousel.dart';
// import '../../../components/footer.dart';
// import '../../../components/menuMobile.dart';
// import '../../../components/navMenu.dart';
// import '../../../components/topbar.dart';
// import '../../../utils/app_theme.dart';
// import '../../controllers/blog_controller.dart';
// import '../../models/blog_models.dart';
// import 'components/blog-details.dart';

// class BlogPage extends StatelessWidget {
//   const BlogPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: MyStatefulWidget());
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//   bool dataAvailable = true;
//   Key key = UniqueKey();

//   List<dynamic> postsList = [];
//   List<dynamic> datas = [];

//   List<IconData> shareMedia = [
//     FontAwesomeIcons.facebook,
//     FontAwesomeIcons.twitter,
//     FontAwesomeIcons.googlePlus,
//     FontAwesomeIcons.pinterest,
//   ];

//   Future<void> fetchContent() async {
//     final fetchedData = await fetchData('');
//     setState(() {
//       if (fetchedData.isNotEmpty) {
//         dataAvailable = false;
//         datas = fetchedData;
//         postsList = fetchedData;
//       } else {
//         dataAvailable = true;
//       }
//     });
//   }

//   void updateData(newData) {
//     setState(() {
//       datas = newData;
//       key = UniqueKey();
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchContent();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double swidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//         key: scaffoldKey,
//         drawer: const drawermenu(),
//         body: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Container(
//                 child: Column(children: <Widget>[
//               TopBar(swidth),
//               if (MediaQuery.of(context).size.width > 1360) ...[
//                 Container(
//                     width: swidth,
//                     height: 125,
//                     margin: EdgeInsets.only(
//                         left: swidth * 0.068, right: swidth * 0.06),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SizedBox(
//                               width: 250,
//                               child: Image.asset('assets/images/logo.png',
//                                   fit: BoxFit.fitHeight)),
//                           NavMenu(swidth: swidth, heightBtn: 50),
//                         ])),
//               ] else ...[
//                menuMobile(context, scaffoldKey, swidth),
//               ],
//               BannerSuperior(context, 'Publicações'),
//               Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     if (dataAvailable == true) ...{
//                       Container(
//                           padding: const EdgeInsets.only(
//                               top: 100, left: 90, right: 15),
//                           width: swidth * 0.67,
//                           child: Text(
//                             "Perdão, não há nenhum post a ser exibido no momento.",
//                           )),
//                     } else ...{
//                       Container(
//                         padding: const EdgeInsets.only(
//                             top: 100, left: 90, right: 15),
//                         width: swidth * 0.67,
//                         height: 850 * (datas.length).toDouble(),
//                         child: ListView.builder(
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: datas.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             final item = datas[index];

//                             String imagePath =
//                                 extractImagePath(item['content']);

//                             String formattedDate =
//                                 convertDate(item['published_date']);

//                             return SizedBox(
//                               height: 800,
//                               width: swidth * .6,
//                               child: Column(children: [
//                                 Container(
//                                   margin: const EdgeInsets.only(bottom: 30),
//                                   decoration: const BoxDecoration(
//                                       border: Border(
//                                           bottom: BorderSide(
//                                     color: Colors.blue,
//                                     width: 8,
//                                   ))),
//                                   child: ImageNetwork(
//                                       key: key,
//                                       image: imagePath,
//                                       width: swidth * .6,
//                                       height: 400,
//                                       fitAndroidIos: BoxFit.cover,
//                                       fitWeb: BoxFitWeb.cover),
//                                 ),
//                                 Container(
//                                     alignment: Alignment.centerLeft,
//                                     margin: const EdgeInsets.only(bottom: 20),
//                                     child: Text(
//                                       item['title'],
//                                     )),
//                                 Row(children: [
//                                   const Icon(Icons.person,
//                                       color: Colors.blue, size: 16),
//                                   Container(width: 2),
//                                   Text('Marketing',
//                                       style: textTheme.labelSmall),
//                                   Container(width: 13),
//                                   const Icon(FontAwesomeIcons.calendarDays,
//                                       color: Colors.blue, size: 16),
//                                   Container(width: 3),
//                                   Text(formattedDate,
//                                       style: textTheme.labelSmall),
//                                 ]),
//                                 Container(
//                                     width: swidth * 0.6,
//                                     margin: const EdgeInsets.only(
//                                         top: 20, bottom: 30),
//                                     child: Text(item['text'],
//                                         maxLines: 5,
//                                         style: textTheme.headlineMedium)),
//                                 Row(children: [
//                                   Material(
//                                     color: Colors.blue,
//                                     child: InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       BlogDetails(
//                                                           initialPageIndex:
//                                                               index)));
//                                         },
//                                         overlayColor:
//                                             const MaterialStatePropertyAll(
//                                                 onPrimary),
//                                         child: SizedBox(
//                                           width: 170,
//                                           height: 50,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               Text(
//                                                 'VER MAIS >',
//                                                 style: textTheme.labelMedium,
//                                               ),
//                                             ],
//                                           ),
//                                         )),
//                                   ),
//                                   const Spacer(),
//                                   Container(
//                                       child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceEvenly,
//                                           children: [
//                                         Text('Share:',
//                                             style: textTheme.headlineMedium),
//                                         Container(width: 5),
//                                         SizedBox(
//                                           width: 120,
//                                           height: 30,
//                                           child: GridView.builder(
//                                               gridDelegate:
//                                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                                       crossAxisCount: 4),
//                                               itemBuilder:
//                                                   (BuildContext context,
//                                                       int index) {
//                                                 return InkWell(
//                                                     overlayColor:
//                                                         const MaterialStatePropertyAll(
//                                                             Colors.transparent),
//                                                     onTap: () {},
//                                                     child: SizedBox(
//                                                       width: 15,
//                                                       height: 15,
//                                                       child: Icon(
//                                                           shareMedia[index],
//                                                           size: 15,
//                                                           color: onPrimary),
//                                                     ));
//                                               }),
//                                         )
//                                       ])),
//                                 ]),
//                               ]),
//                             );
//                           },
//                         ),
//                       ),
//                     },
//                     Container(
//                         padding: const EdgeInsets.only(top: 85.0, left: 15),
//                         width: swidth * .33,
//                         child: blogFilters(context, swidth, postsList,
//                             dataAvailable, updateData)),
//                   ]),
//               Carousel(swidth),
//               Footer(swidth),
//             ]))));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_network/image_network.dart';
import 'package:obamahome/app/views/blog/components/blog-filters.dart';
import 'package:obamahome/components/bannerSuperior.dart';
import 'package:obamahome/components/drawer.dart';

import '../../../components/carousel.dart';
import '../../../components/footer.dart';
import '../../../components/navMenu.dart';
import '../../../components/topbar.dart';
import '../../../utils/app_theme.dart';
import '../../controllers/blog_controller.dart';
import '../../models/blog_models.dart';
import 'components/blog-details.dart';

List<IconData> shareMedia = [
  FontAwesomeIcons.facebook,
  FontAwesomeIcons.twitter,
  FontAwesomeIcons.googlePlus,
  FontAwesomeIcons.pinterest,
];

class BlogPage extends ConsumerStatefulWidget {
  const BlogPage({Key? key}) : super(key: key);
  @override
  BlogPageState createState() => BlogPageState();
}

class BlogPageState extends ConsumerState<BlogPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool dataAvailable = false;
  Key key = UniqueKey();

  void updateData(newData) {
    // print(newData);
    // setState(() {
    //   po = newData;
    //   key = UniqueKey();
    // });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return FutureBuilder<void>(
      future: BlogController().updateBlogContent(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final blogDataList = ref.watch(seila);
          List<BlogModel?> posts = blogDataList;
          // print("aqui => ${posts.length}");
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
                                    child: const Icon(Icons.menu,
                                        color: onPrimary),
                                    onPressed: () =>
                                        scaffoldKey.currentState?.openDrawer()),
                                Container(
                                    width: 280,
                                    margin: const EdgeInsets.only(
                                        right: 15, left: 15),
                                    child: Image.asset('assets/images/logo.png',
                                        fit: BoxFit.fitHeight)),
                                TextButton(
                                    onPressed: () {},
                                    child: const Icon(Icons.search,
                                        color: onPrimary, size: 25))
                              ]))
                    ],
                    BannerSuperior(context, 'Publicações'),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 100, left: 90, right: 15),
                            child: blogListView(context, key, swidth, posts),
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.only(top: 85.0, left: 15),
                              width: swidth * .33,
                              child: blogFilters(context, swidth, posts,
                                  dataAvailable, updateData)),
                        ]),
                    Carousel(swidth),
                    Footer(swidth),
                  ]))));
        } else if (snapshot.hasError) {
          Container(
              padding: const EdgeInsets.only(top: 100, left: 90, right: 15),
              width: swidth * 0.67,
              child: Text(
                "Perdão, não há nenhum post a ser exibido no momento.",
              ));
        }
        return CircularProgressIndicator();
      },
    );
  }
}

@override
Widget blogListView(BuildContext context, key, swidth, posts) {
  List<BlogModel> post = [...posts];

  print(" aqui, OTÀRIO => ${post[0].imagePath}");

  return SizedBox(
    height: 850*(post.length).toDouble(),
    child: Column(children: [
      for (var i = 0; i < post.length; i++) ...{
        SizedBox(
            height: 800,
            width: swidth * .57,
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.blue,
                  width: 8,
                ))),
                child: ImageNetwork(
                    key: key,
                    image: post[i].imagePath,
                    width: swidth * .6,
                    height: 400,
                    fitAndroidIos: BoxFit.cover,
                    fitWeb: BoxFitWeb.cover),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    post[i].title, style: textTheme.titleSmall
                  )),
              Row(children: [
                const Icon(Icons.person, color: Colors.blue, size: 16),
                Container(width: 2),
                Text('Marketing', style: textTheme.labelSmall),
                Container(width: 13),
                const Icon(FontAwesomeIcons.calendarDays,
                    color: Colors.blue, size: 16),
                Container(width: 3),
                Text(post[i].publishedDate, style: textTheme.labelSmall),
              ]),
              Container(
                  width: swidth * 0.6,
                  margin: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Text(post[i].text,
                      maxLines: 5, style: textTheme.headlineMedium)),
              Row(children: [
                Material(
                  color: Colors.blue,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BlogDetails(initialPageIndex: i)));
                      },
                      overlayColor: const MaterialStatePropertyAll(onPrimary),
                      child: SizedBox(
                        width: 170,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'VER MAIS >',
                              style: textTheme.labelMedium,
                            ),
                          ],
                        ),
                      )),
                ),
                const Spacer(),
                Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      Text('Share:', style: textTheme.headlineMedium),
                      Container(width: 5),
                      SizedBox(
                        width: 120,
                        height: 30,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: shareMedia.length),
                            itemBuilder: (BuildContext context, int mediaId) {
                              return InkWell(
                                  overlayColor: const MaterialStatePropertyAll(
                                      Colors.transparent),
                                  onTap: () {},
                                  child: SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: Icon(shareMedia[mediaId],
                                        size: 15, color: onPrimary),
                                  ));
                            }),
                      )
                    ])),
              ]),
            ]))
      },
    ]),
  );
}
