import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class drawermenu extends StatelessWidget {
  const drawermenu({super.key});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return Drawer(
        width: swidth * 0.3,

        child: ListView(
          children: [
            ExpansionTile(
                trailing: const Icon(FontAwesomeIcons.plus, size: 13),
                title: ListView(shrinkWrap: true, children: [
                  Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: const Text("Home"))
                ]),
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                              width: swidth * 0.3,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text("Item 1",
                                  style: TextStyle(color: Colors.black))))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                              width: swidth * 0.3,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text("Item 2",
                                  style: TextStyle(color: Colors.black)))))
                ]),
            ExpansionTile(
                trailing: const SizedBox.shrink(),
                title: ListView(shrinkWrap: true, children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/aboutus');
                      },
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("SOBRE NÓS")))
                ])),
            ExpansionTile(
                trailing: const Icon(FontAwesomeIcons.plus, size: 13),
                title: ListView(shrinkWrap: true, children: [
                  Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: const Text("SERVICES"))
                ]),
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                              width: swidth * 0.3,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text("Item 1",
                                  style: TextStyle(color: Colors.black))))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                              width: swidth * 0.3,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text("Item 2",
                                  style: TextStyle(color: Colors.black)))))
                ]),
            ExpansionTile(
                trailing: const Icon(FontAwesomeIcons.plus, size: 13),
                title: ListView(shrinkWrap: true, children: [
                  Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: const Text("PUBLICAÇÕES"))
                ]),
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/blog');
                          },
                          child: Container(
                              width: swidth * 0.3,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text("Item 1",
                                  style: TextStyle(color: Colors.black))))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/blog-details');
                          },
                          child: Container(
                              width: swidth * 0.3,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text("Item 2",
                                  style: TextStyle(color: Colors.black)))))
                ]),
            ExpansionTile(
                trailing: const Icon(FontAwesomeIcons.plus, size: 13),
                title: ListView(shrinkWrap: true, children: [
                  Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: const Text("PAGES"))
                ]),
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                              width: swidth * 0.3,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text("Item 1",
                                  style: TextStyle(color: Colors.black))))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                              width: swidth * 0.3,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text("Item 2",
                                  style: TextStyle(color: Colors.black)))))
                ]),
            ExpansionTile(
                trailing: const Icon(FontAwesomeIcons.plus, size: 13),
                title: ListView(shrinkWrap: true, children: [
                  Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: const Text("SHOP"))
                ]),
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                              width: swidth * 0.3,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text("Item 1",
                                  style: TextStyle(color: Colors.black))))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                              width: swidth * 0.3,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text("Item 2",
                                  style: TextStyle(color: Colors.black)))))
                ]),
            ExpansionTile(
                trailing: const Icon(FontAwesomeIcons.plus, size: 13),
                title: ListView(shrinkWrap: true, children: [
                  Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: const Text("CONTACT"))
                ]),
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                              width: swidth * 0.3,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text("Item 1",
                                  style: TextStyle(color: Colors.black))))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                              width: swidth * 0.3,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text("Item 2",
                                  style: TextStyle(color: Colors.black)))))
                ])
          ],
        ));
  }
}
