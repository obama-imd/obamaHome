import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/components/drawer.dart';

import '../../components/footer.dart';
import '../../components/menu.dart';
import '../../components/topbar.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyStatefulWidget());
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
        drawer: drawermenu(),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
                child: Column(children: <Widget>[
              TopBar(swidth),
              if (MediaQuery.of(context).size.width > 1360) ...[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    margin: EdgeInsets.only(left: swidth * 0.068),
                    child: Row(children: [
                      Container(
                          width: 250,
                          child: Image.asset('assets/images/logo.png',
                              fit: BoxFit.fitHeight)),
                      Container(width: swidth * 0.177),
                      Container(
                        width: swidth * 0.513,
                        child: Row(children: [
                          // Container(
                          //     padding: EdgeInsets.all(9.2),
                          //     child: MenuBar0(context)),
                          Container(
                              padding: EdgeInsets.all(9.2),
                              child: MenuBar1(context)),
                          Container(
                              padding: EdgeInsets.all(9.2),
                              child: MenuBar2(context)),
                          Container(
                              padding: EdgeInsets.all(9.2),
                              child: MenuBar3(context)),
                          Container(
                              padding: EdgeInsets.all(9.2),
                              child: MenuBar4(context)),
                          Container(
                              padding: EdgeInsets.all(9.2),
                              child: MenuBar5(context)),
                          Container(
                              padding: EdgeInsets.all(9.2),
                              child: MenuBar6(context)),
                          Container(
                              padding: EdgeInsets.all(9.5),
                              child: MenuBar7(context))
                        ]),
                      )
                    ])),
              ] else ...[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              child: Icon(Icons.menu, color: Colors.black),
                              onPressed: () =>
                                  scaffoldKey.currentState?.openDrawer()),
                          Container(
                              width: 280,
                              margin: EdgeInsets.only(right: 15, left: 15),
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/img.jpg'),
                          fit: BoxFit.cover),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    padding: EdgeInsets.only(top: 85.0, left: 92.0),
                    child: ListView(children: [
                      Text(
                        'Publicações',
                        textScaleFactor: 3.1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          child: Row(children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Home',
                              textScaleFactor: 1.11,
                              style: TextStyle(color: Colors.blue),
                            )),
                        Text(
                          '>  ',
                          textScaleFactor: 1.11,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Publicações',
                          textScaleFactor: 1.11,
                          style: TextStyle(color: Colors.white),
                        ),
                      ]))
                    ]))
              ])),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    padding: EdgeInsets.only(
                        top: 100, left: 90, right: 60, bottom: 100),
                    width: swidth * 0.67,
                    child: Column(children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text('Post Title',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      Row(children: [
                        Icon(Icons.person, color: Colors.blue, size: 16),
                        Container(width: 2),
                        Text('Marketing', style: TextStyle(color: Colors.blue)),
                        Container(width: 13),
                        Icon(FontAwesomeIcons.comment,
                            color: Colors.blue, size: 16),
                        Container(width: 3),
                        Text('0', style: TextStyle(color: Colors.blue)),
                        Container(width: 13),
                        Icon(FontAwesomeIcons.calendarDays,
                            color: Colors.blue, size: 16),
                        Container(width: 3),
                        Text('22/08/2022',
                            style: TextStyle(color: Colors.blue)),
                      ]),
                      Container(
                          width: swidth * 0.6,
                          height: 100,
                          margin: EdgeInsets.only(top: 20, bottom: 30),
                          child: Text('Texto', style: TextStyle(fontSize: 16))),
                      Row(children: [
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              color: Colors.blue,
                              width: 150,
                              height: 50,
                              alignment: Alignment.center,
                              child: Text('READ MORE >',
                                  style: TextStyle(color: Colors.white)),
                            )),
                        Spacer(),
                        Container(
                            padding: EdgeInsets.only(right: 13),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Share:',
                                      style: TextStyle(fontSize: 16)),
                                  Container(width: 5),
                                  SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Icon(FontAwesomeIcons.facebook,
                                              size: 15, color: Colors.black))),
                                  Container(width: 13),
                                  SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Icon(FontAwesomeIcons.twitter,
                                              size: 15, color: Colors.black))),
                                  Container(width: 13),
                                  SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Icon(
                                              FontAwesomeIcons.googlePlus,
                                              size: 15,
                                              color: Colors.black))),
                                  Container(width: 13),
                                  SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Icon(
                                              FontAwesomeIcons.pinterest,
                                              size: 15,
                                              color: Colors.black)))
                                ])),
                      ]),
                    ])),
                Container(
                    padding: EdgeInsets.only(top: 100, right: 80, bottom: 100),
                    width: swidth * 0.33,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Text('SEARCH',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 30)),
                          Container(
                              height: 50,
                              width: swidth * 0.25,
                              margin: EdgeInsets.only(bottom: 50),
                              child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      hintText: 'E-mail',
                                      contentPadding: EdgeInsets.all(15.0),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 218, 216, 216),
                                      suffixIcon: Icon(Icons.search)))),
                          Container(
                              child: Text('ABOUT AUTHOR',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 20)),
                          Container(
                              child:
                                  Text('Texto', style: TextStyle(fontSize: 18)),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 100)),
                          Container(
                              child: Text('RECENT POST',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 20)),
                          Container(
                              width: swidth * 0.29,
                              height: 200,
                              child: Column(children: [
                                Container(
                                    width: swidth * 0.29,
                                    height: 20,
                                    child: Text('Post 1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))),
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 20),
                                    child: Row(children: [
                                      Icon(FontAwesomeIcons.calendarDays,
                                          color: Colors.black, size: 15),
                                      Text('22/08/2022')
                                    ])),
                                Container(
                                    width: swidth * 0.29,
                                    height: 20,
                                    child: Text('Post 2',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))),
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 20),
                                    child: Row(children: [
                                      Icon(FontAwesomeIcons.calendarDays,
                                          color: Colors.black, size: 15),
                                      Text('22/08/2022')
                                    ])),
                                Container(
                                    width: swidth * 0.29,
                                    height: 20,
                                    child: Text('Post 3',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600))),
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 20),
                                    child: Row(children: [
                                      Icon(FontAwesomeIcons.calendarDays,
                                          color: Colors.black, size: 15),
                                      Text('22/08/2022')
                                    ])),
                              ])),
                          Container(
                              child: Text('CATEGORIES',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  top: 70, bottom: 20, right: swidth * 0.07)),
                          Column(children: [
                            Container(
                                color: Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 1',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ])),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015)),
                            Container(
                                color: Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 2',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ])),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015)),
                            Container(
                                color: Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 3',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ])),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015)),
                            Container(
                                color: Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 4',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ])),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015)),
                            Container(
                                color: Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 5',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ])),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015)),
                          ]),
                          Container(
                              child: Text('TAG',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  top: 60, right: swidth * 0.015)),
                          Row(children: [
                            Container(
                                padding: EdgeInsets.all(15),
                                height: 50,
                                width: 114,
                                margin: EdgeInsets.only(
                                    right: 5, top: 30, bottom: 60),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: .5),
                                    borderRadius: BorderRadius.circular(100)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text('Bootstrap',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black)))),
                            Container(
                                padding: EdgeInsets.all(15),
                                height: 50,
                                width: 104,
                                margin: EdgeInsets.only(
                                    right: 5, top: 30, bottom: 60),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: .5),
                                    borderRadius: BorderRadius.circular(100)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text('HTML5',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black)))),
                            Container(
                                padding: EdgeInsets.all(15),
                                height: 50,
                                width: 120,
                                margin: EdgeInsets.only(top: 30, bottom: 60),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: .5),
                                    borderRadius: BorderRadius.circular(100)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text('Wordpress',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black)))),
                          ]),
                          Container(
                              child: Text('CATEGORIES',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 20, right: swidth * 0.07)),
                          Column(children: [
                            Container(
                                color: Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 1',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ])),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015)),
                            Container(
                                color: Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 2',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ])),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015)),
                            Container(
                                color: Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 3',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ])),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015)),
                            Container(
                                color: Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 4',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ])),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015)),
                            Container(
                                color: Color.fromARGB(255, 235, 235, 235),
                                width: swidth * 0.3,
                                height: 40,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Row(children: [
                                      Icon(Icons.arrow_right,
                                          color: Colors.black),
                                      Text('Text 5',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black))
                                    ])),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    bottom: 4, right: swidth * 0.015)),
                          ])
                        ]))
              ]),
              if (swidth > 1300) ...[
                Container(
                    height: 875,
                    width: swidth,
                    child: Stack(children: <Widget>[
                      Column(children: [
                        Container(height: 100, width: swidth),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(top: 50),
                            height: 700,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/test.png'),
                                  fit: BoxFit.cover),
                            ))
                      ]),
                      Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Container(height: 140),
                            Container(
                                padding: EdgeInsets.only(left: 90, top: 100),
                                child: Text('What Clients Say?',
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            Container(
                                padding: EdgeInsets.only(top: 15, left: 90),
                                child: Text(
                                  'Here are testimonials from clients..',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                            Container(height: 20),
                            Row(children: [
                              Container(width: 91),
                              SizedBox(
                                  height: 5.0,
                                  width: 82.0,
                                  child: Image.asset('assets/images/img2.jpg',
                                      fit: BoxFit.cover)),
                            ]),
                            Container(height: 40, width: swidth),
                            ImageSlideshow(
                              width: 760,

                              /// Width of the [ImageSlideshow].
                              height: 240,

                              /// Height of the [ImageSlideshow].
                              initialPage: 0,

                              /// The page to show when first creating the [ImageSlideshow].
                              indicatorColor: Colors.blue,

                              /// The color to paint the indicator.
                              indicatorBackgroundColor: Colors.grey,

                              /// The color to paint behind th indicator.
                              children: [
                                Row(children: [
                                  Container(width: 90),
                                  Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/client.jpg'),
                                              fit: BoxFit.cover))),
                                  Container(width: 20),
                                  Container(
                                      padding: EdgeInsets.only(left: 10),
                                      height: 150,
                                      width: 500,
                                      child: ListView(children: [
                                        Text('Texto',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        Container(height: 65),
                                        Text('Maria Anderson',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 20),
                                        Text('CFO, Tech NY',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18))
                                      ])),
                                ]),
                                Row(children: [
                                  Container(width: 90),
                                  Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/client.jpg'),
                                              fit: BoxFit.cover))),
                                  Container(width: 20),
                                  Container(
                                      padding: EdgeInsets.only(left: 10),
                                      height: 150,
                                      width: 500,
                                      child: ListView(children: [
                                        Text('Texto',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        Container(height: 65),
                                        Text('Maria Anderson',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 20),
                                        Text('CFO, Tech NY',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18))
                                      ])),
                                ]),
                                Row(children: [
                                  Container(width: 90),
                                  Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/client.jpg'),
                                              fit: BoxFit.cover))),
                                  Container(width: 20),
                                  Container(
                                      padding: EdgeInsets.only(left: 10),
                                      height: 150,
                                      width: 500,
                                      child: ListView(children: [
                                        Text('Texto',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        Container(height: 65),
                                        Text('Maria Anderson',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 20),
                                        Text('CFO, Tech NY',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18))
                                      ]))
                                ])
                              ],

                              /// Called whenever the page in the center of the viewport changes.
                              onPageChanged: (value) {
                                print('Page changed: $value');
                              },

                              /// Auto scroll interval.
                              /// Do not auto scroll with null or 0.
                              autoPlayInterval: 3500,

                              /// Loops back to first slide.
                              isLoop: true,
                            ),
                            Container(width: swidth * 0.8, height: 80),
                            Center(
                                child: Container(
                                    color: Colors.blue,
                                    height: 150,
                                    width: swidth * 0.85,
                                    child: Row(children: [
                                      Container(width: 30),
                                      Container(
                                          width: 100,
                                          height: 100,
                                          child: Icon(
                                            Icons.phone,
                                            size: 70,
                                            color: Colors.white,
                                          )),
                                      Container(
                                          width: 500,
                                          height: 100,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('REQUEST A FREE QUOTE',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 34,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    'Get answers and advice from people you want ir from.',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18))
                                              ])),
                                      Container(width: swidth * 0.248),
                                      Container(
                                          height: 50,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.black),
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Text('CONTACT US',
                                                  style: TextStyle(
                                                      shadows: [
                                                        Shadow(
                                                            offset: Offset(
                                                                1.1, 1.1))
                                                      ],
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white)))),
                                    ]))),
                          ])),
                    ])),
                Container(width: swidth * 0.9, height: 40),
                Container(
                    width: swidth * 0.85,
                    child: Center(
                        child: Row(children: [
                      Container(width: 6, height: 100),
                      Container(
                          height: 100,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 100),
                      Container(
                          height: 100,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 100),
                      Container(
                          height: 100,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 100),
                      Container(
                          height: 100,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 100),
                      Container(
                          height: 100,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                    ])))
              ] else ...[
                Container(height: 100, width: swidth),
                Container(
                    height: 550,
                    width: swidth,
                    child: Stack(children: <Widget>[
                      Column(children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(top: 50),
                            height: 550,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/test.png'),
                                  fit: BoxFit.cover),
                            ))
                      ]),
                      ListView(children: [
                        Container(height: 40),
                        Container(
                            padding: EdgeInsets.only(left: 40, top: 50),
                            child: Text('What Clients Say?',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                        Container(
                            padding: EdgeInsets.only(top: 15, left: 40),
                            child: Text(
                              'Here are testimonials from clients..',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )),
                        Container(height: 20),
                        Row(children: [
                          Container(width: 40),
                          SizedBox(
                              height: 5.0,
                              width: 82.0,
                              child: Image.asset('assets/images/img2.jpg',
                                  fit: BoxFit.cover)),
                        ]),
                        Container(height: 40, width: swidth),
                        ImageSlideshow(
                          width: swidth - 140,

                          /// Width of the [ImageSlideshow].
                          height: 240,

                          /// Height of the [ImageSlideshow].
                          initialPage: 0,

                          /// The page to show when first creating the [ImageSlideshow].
                          indicatorColor: Colors.blue,

                          /// The color to paint the indicator.
                          indicatorBackgroundColor: Colors.grey,

                          /// The color to paint behind th indicator.
                          children: [
                            Row(children: [
                              Container(width: 20),
                              Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/client.jpg'),
                                          fit: BoxFit.cover))),
                              Container(
                                  padding: EdgeInsets.only(left: 30),
                                  height: 150,
                                  width: swidth - 140,
                                  child: ListView(children: [
                                    Text('Texto',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Container(height: 65),
                                    Text('Maria Anderson',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Container(height: 20),
                                    Text('CFO, Tech NY',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16))
                                  ])),
                            ]),
                            Row(children: [
                              Container(width: 20),
                              Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/client.jpg'),
                                          fit: BoxFit.cover))),
                              Container(
                                  padding: EdgeInsets.only(left: 30),
                                  height: 150,
                                  width: swidth - 140,
                                  child: ListView(children: [
                                    Text('Texto',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Container(height: 65),
                                    Text('Maria Anderson',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Container(height: 20),
                                    Text('CFO, Tech NY',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16))
                                  ])),
                            ]),
                            Row(children: [
                              Container(width: 20),
                              Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/client.jpg'),
                                          fit: BoxFit.cover))),
                              Container(
                                  padding: EdgeInsets.only(left: 30),
                                  height: 150,
                                  width: swidth - 140,
                                  child: ListView(children: [
                                    Text('Texto',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Container(height: 65),
                                    Text('Maria Anderson',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Container(height: 20),
                                    Text('CFO, Tech NY',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16))
                                  ]))
                            ])
                          ],

                          /// Called whenever the page in the center of the viewport changes.
                          onPageChanged: (value) {
                            print('Page changed: $value');
                          },
                          autoPlayInterval: 3500,

                          /// Loops back to first slide.
                          isLoop: true,
                        )
                      ])
                    ])),
                Container(width: swidth * 0.8, height: 20),
                Center(
                    child: Container(
                        color: Colors.blue,
                        height: 180,
                        width: swidth * 0.95,
                        child: Column(children: [
                          Container(width: 30),
                          Row(children: [
                            Container(width: 15),
                            Container(
                                width: 50,
                                height: 100,
                                child: Icon(
                                  Icons.phone,
                                  size: 40,
                                  color: Colors.white,
                                )),
                            Container(
                                width: swidth * 0.7,
                                height: 100,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('REQUEST A FREE QUOTE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          'Get answers and advice from people you want ir from.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12))
                                    ]))
                          ]),
                          Container(width: swidth * 0.25),
                          Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text('CONTACT US',
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(offset: Offset(1.1, 1.1))
                                          ],
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)))),
                        ]))),
                Container(width: swidth * 0.9, height: 40),
                Container(
                    width: swidth * 0.9,
                    child: Center(
                        child: Column(children: [
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 12),
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 12),
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 12),
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 12),
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                    ])))
              ],
              Container(height: 60),
              Footer(swidth),
            ]))));
  }
}
