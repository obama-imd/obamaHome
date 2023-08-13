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
                    width: swidth,
                    height: 125,
                    margin: EdgeInsets.only(left: swidth * 0.068, right: swidth * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                          width: 250,
                          child: Image.asset('assets/images/logo.png',
                              fit: BoxFit.fitHeight)),
                      navBarMenu(context, swidth),
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
                              height: 210,
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
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}
