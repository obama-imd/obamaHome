import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/components/drawer.dart';

import '../../components/carousel.dart';
import '../../components/footer.dart';
import '../../components/menu.dart';
import '../../components/topbar.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);
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
                    margin: EdgeInsets.only(left: swidth * 0.068, right: swidth * 0.06),
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
                              child: const Icon(Icons.menu, color: Colors.black),
                              onPressed: () =>
                                  scaffoldKey.currentState?.openDrawer()),
                          Container(
                              width: 280,
                              margin: const EdgeInsets.only(right: 15, left: 15),
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
                Container(
                    padding: const EdgeInsets.only(
                        top: 100, left: 90, right: 60, bottom: 100),
                    width: swidth * 0.67,
                    child: Column(children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: const Text('Post Title',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      Row(children: [
                        const Icon(Icons.person, color: Colors.blue, size: 16),
                        Container(width: 2),
                        const Text('Marketing', style: TextStyle(color: Colors.blue)),
                        Container(width: 13),
                        const Icon(FontAwesomeIcons.comment,
                            color: Colors.blue, size: 16),
                        Container(width: 3),
                        const Text('0', style: TextStyle(color: Colors.blue)),
                        Container(width: 13),
                        const Icon(FontAwesomeIcons.calendarDays,
                            color: Colors.blue, size: 16),
                        Container(width: 3),
                        const Text('22/08/2022',
                            style: TextStyle(color: Colors.blue)),
                      ]),
                      Container(
                          width: swidth * 0.6,
                          height: 100,
                          margin: const EdgeInsets.only(top: 20, bottom: 30),
                          child: const Text('Texto', style: TextStyle(fontSize: 16))),
                      Row(children: [
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              color: Colors.blue,
                              width: 150,
                              height: 50,
                              alignment: Alignment.center,
                              child: const Text('READ MORE >',
                                  style: TextStyle(color: Colors.white)),
                            )),
                        const Spacer(),
                        Container(
                            padding: const EdgeInsets.only(right: 13),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text('Share:',
                                      style: TextStyle(fontSize: 16)),
                                  Container(width: 5),
                                  SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Icon(FontAwesomeIcons.facebook,
                                              size: 15, color: Colors.black))),
                                  Container(width: 13),
                                  SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Icon(FontAwesomeIcons.twitter,
                                              size: 15, color: Colors.black))),
                                  Container(width: 13),
                                  SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Icon(
                                              FontAwesomeIcons.googlePlus,
                                              size: 15,
                                              color: Colors.black))),
                                  Container(width: 13),
                                  SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Icon(
                                              FontAwesomeIcons.pinterest,
                                              size: 15,
                                              color: Colors.black)))
                                ])),
                      ]),
                    ])),
                Container(
                    padding: const EdgeInsets.only(top: 100, right: 80, bottom: 100),
                    width: swidth * 0.33,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(bottom: 30),
                              child: const Text('SEARCH',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))),
                          Container(
                              height: 50,
                              width: swidth * 0.25,
                              margin: const EdgeInsets.only(bottom: 50),
                              child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      hintText: 'E-mail',
                                      contentPadding: const EdgeInsets.all(15.0),
                                      filled: true,
                                      fillColor:
                                          const Color.fromARGB(255, 218, 216, 216),
                                      suffixIcon: const Icon(Icons.search)))),
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text('ABOUT AUTHOR',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))),
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(bottom: 100),
                              child:
                                  const Text('Texto', style: TextStyle(fontSize: 18))),
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text('RECENT POST',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))),
                          SizedBox(
                              width: swidth * 0.29,
                              height: 210,
                              child: Column(children: [
                                SizedBox(
                                    width: swidth * 0.29,
                                    height: 20,
                                    child: const Text('Post 1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))),
                                Container(
                                    margin:
                                        const EdgeInsets.only(top: 10, bottom: 20),
                                    child: const Row(children: [
                                      Icon(FontAwesomeIcons.calendarDays,
                                          color: Colors.black, size: 15),
                                      Text('22/08/2022')
                                    ])),
                                SizedBox(
                                    width: swidth * 0.29,
                                    height: 20,
                                    child: const Text('Post 2',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))),
                                Container(
                                    margin:
                                        const EdgeInsets.only(top: 10, bottom: 20),
                                    child: const Row(children: [
                                      Icon(FontAwesomeIcons.calendarDays,
                                          color: Colors.black, size: 15),
                                      Text('22/08/2022')
                                    ])),
                                SizedBox(
                                    width: swidth * 0.29,
                                    height: 20,
                                    child: const Text('Post 3',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))),
                                Container(
                                    margin:
                                        const EdgeInsets.only(top: 10, bottom: 20),
                                    child: const Row(children: [
                                      Icon(FontAwesomeIcons.calendarDays,
                                          color: Colors.black, size: 15),
                                      Text('22/08/2022')
                                    ])),
                              ])),
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  top: 70, bottom: 20, right: swidth * 0.07),
                              child: const Text('CATEGORIES',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))),
                          Column(children: [
                            Container(
                                color: const Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 1',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ]))),
                            Container(
                                color: const Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 2',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ]))),
                            Container(
                                color: const Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 3',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ]))),
                            Container(
                                color: const Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 4',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ]))),
                            Container(
                                color: const Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 5',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ]))),
                          ]),
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  top: 60, right: swidth * 0.015),
                              child: const Text('TAG',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))),
                          Row(children: [
                            Container(
                                padding: const EdgeInsets.all(15),
                                height: 50,
                                width: 114,
                                margin: const EdgeInsets.only(
                                    right: 5, top: 30, bottom: 60),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: .5),
                                    borderRadius: BorderRadius.circular(100)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text('Bootstrap',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black)))),
                            Container(
                                padding: const EdgeInsets.all(15),
                                height: 50,
                                width: 104,
                                margin: const EdgeInsets.only(
                                    right: 5, top: 30, bottom: 60),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: .5),
                                    borderRadius: BorderRadius.circular(100)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text('HTML5',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black)))),
                            Container(
                                padding: const EdgeInsets.all(15),
                                height: 50,
                                width: 120,
                                margin: const EdgeInsets.only(top: 30, bottom: 60),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: .5),
                                    borderRadius: BorderRadius.circular(100)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text('Wordpress',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black)))),
                          ]),
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 20, right: swidth * 0.07),
                              child: const Text('CATEGORIES',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))),
                          Column(children: [
                            Container(
                                color: const Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 1',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ]))),
                            Container(
                                color: const Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 2',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ]))),
                            Container(
                                color: const Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 3',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ]))),
                            Container(
                                color: const Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 4',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ]))),
                            Container(
                                color: const Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015),
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 5',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ]))),
                          ])
                        ]))
              ]),
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}
