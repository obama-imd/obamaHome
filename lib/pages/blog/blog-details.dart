import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_network/image_network.dart';
import 'package:intl/intl.dart';
import 'package:obamahome/components/drawer.dart';
import 'package:obamahome/pages/blog/blog-filters.dart';

import '../../../components/carousel.dart';
import '../../../components/footer.dart';
import '../../../components/menu.dart';
import '../../../components/topbar.dart';
import '../../../services/api_blog.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({Key? key}) : super(key: key);
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
  bool dataAvailable = true;

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<dynamic> datas = [];

  List<IconData> shareMedia = [
    FontAwesomeIcons.facebook,
    FontAwesomeIcons.twitter,
    FontAwesomeIcons.googlePlus,
    FontAwesomeIcons.pinterest,
  ];

  Future<void> fetchContent() async {
    final fetchedData = await fetchData();
    setState(() {
      if (fetchedData.isNotEmpty) {
        dataAvailable = false;
        datas = fetchedData;
      } else {
        dataAvailable = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchContent();
  }

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
                          navBarMenu(context, swidth),
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
                                  const Icon(Icons.menu, color: Colors.black),
                              onPressed: () =>
                                  scaffoldKey.currentState?.openDrawer()),
                          Container(
                              width: 280,
                              margin:
                                  const EdgeInsets.only(right: 15, left: 15),
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                          TextButton(
                              onPressed: () {},
                              child: const Icon(Icons.search,
                                  color: Colors.black, size: 25))
                        ]))
              ],
              Container(
                  child: Stack(children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/img.jpg'),
                          fit: BoxFit.cover),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    padding: const EdgeInsets.only(top: 85.0, left: 92.0),
                    child: ListView(children: [
                      const Text(
                        'Publicações',
                        textScaleFactor: 3.1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          child: Row(children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Home',
                              textScaleFactor: 1.11,
                              style: TextStyle(color: Colors.blue),
                            )),
                        const Text(
                          '>  ',
                          textScaleFactor: 1.11,
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          'Publicações',
                          textScaleFactor: 1.11,
                          style: TextStyle(color: Colors.white),
                        ),
                      ]))
                    ]))
              ])),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                if (dataAvailable == true) ...{
                  Container(
                      padding:
                          const EdgeInsets.only(top: 100, left: 90, right: 60),
                      width: swidth * 0.67,
                      child: const Text(
                          "Perdão, não há nenhum post a ser exibido no momento.")),
                } else ...{
                  Container(
                    padding:
                        const EdgeInsets.only(top: 100, left: 90, right: 60),
                    width: swidth * 0.67,
                    height: 1400,
                    child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: datas.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = datas[index];

                        String imagePath = extractImagePath(item['content']);

                        final prevItem = index > 0 ? datas[index - 1] : null;
                        final nextItem =
                            index < datas.length - 1 ? datas[index + 1] : null;

                        String previmagePath = prevItem != null
                            ? extractImagePath(prevItem['content'])
                            : "";
                        String nextimagePath = nextItem != null
                            ? extractImagePath(nextItem['content'])
                            : "";

                        String pubDate = item['published_date'];
                        DateTime dateTime = DateTime.parse(pubDate);
                        String formattedDate =
                            DateFormat('dd/MM/yyyy').format(dateTime);

                        return SizedBox(
                          height: 1400,
                          width: swidth * .6,
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
                                  image: imagePath,
                                  width: swidth * .6,
                                  height: 400,
                                  fitAndroidIos: BoxFit.cover,
                                  fitWeb: BoxFitWeb.cover),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Text(item['title'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                            Row(children: [
                              const Icon(Icons.person,
                                  color: Colors.blue, size: 16),
                              Container(width: 2),
                              const Text('Marketing',
                                  style: TextStyle(color: Colors.blue)),
                              Container(width: 13),
                              const Icon(FontAwesomeIcons.comment,
                                  color: Colors.blue, size: 16),
                              Container(width: 3),
                              const Text('0',
                                  style: TextStyle(color: Colors.blue)),
                              Container(width: 13),
                              const Icon(FontAwesomeIcons.calendarDays,
                                  color: Colors.blue, size: 16),
                              Container(width: 3),
                              Text(formattedDate,
                                  style: const TextStyle(color: Colors.blue)),
                            ]),
                            Container(
                                width: swidth * 0.6,
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 30),
                                child: Text(item['text'],
                                    style: const TextStyle(fontSize: 16))),
                            Row(children: [
                              Container(),
                              Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                    const Text('Share:',
                                        style: TextStyle(fontSize: 16)),
                                    Container(width: 5),
                                    SizedBox(
                                      width: 120,
                                      height: 30,
                                      child: GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                                overlayColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                onTap: () {},
                                                child: SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                  child: Icon(shareMedia[index],
                                                      size: 15,
                                                      color: Colors.black),
                                                ));
                                          }),
                                    )
                                  ])),
                            ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (index > 0 && previmagePath != "") ...{
                                    Column(
                                      children: [
                                        ImageNetwork(
                                            image: previmagePath,
                                            width: 150,
                                            height: 100),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (_pageController.hasClients) {
                                              _pageController.animateToPage(
                                                index - 1,
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                curve: Curves.easeInOut,
                                              );
                                            }
                                          },
                                          child: const Text('< Anterior', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                                        ),
                                        Container(),
                                      ],
                                    ),
                                  },
                                  if (index < datas.length - 1 &&
                                      nextimagePath != "") ...{
                                    Container(),
                                    Column(
                                      children: [
                                        ImageNetwork(
                                            image: nextimagePath,
                                            width: 150,
                                            height: 100),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (_pageController.hasClients) {
                                              _pageController.animateToPage(
                                                index + 1,
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                curve: Curves.easeInOut,
                                              );
                                            }
                                          },
                                          child: const Text('Próximo >'),
                                        )
                                      ],
                                    ),
                                  }
                                ]),
                          ]),
                        );
                      },
                    ),
                  ),
                },
                Container(
                    padding: const EdgeInsets.only(top: 85.0),
                    width: swidth * .23,
                    child: blogFilters(context, swidth, datas)),
              ]),
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}
