import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dropdowns extends StatelessWidget {
  const Dropdowns({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (MediaQuery.of(context).size.width > 1200) ...[
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: const Column(children: [
                ExpansionTile(
                    title: Row(children: [
                      SizedBox(height: 30, width: 2),
                      Icon(FontAwesomeIcons.chartColumn, size: 19),
                      SizedBox(height: 30, width: 10),
                      Text('Texto', style: TextStyle(color: Colors.black)),
                    ]),
                    children: [
                      ListTile(
                          title: Text('Texto', style: TextStyle(height: 1.4)))
                    ]),
                SizedBox(height: 20, width: 10),
                ExpansionTile(
                    title: Row(children: [
                      Icon(Icons.airplanemode_active, size: 21),
                      SizedBox(height: 30, width: 10),
                      Text('Texto', style: TextStyle(color: Colors.black)),
                    ]),
                    children: [
                      ListTile(
                          title: Text('Texto', style: TextStyle(height: 1.4))),
                    ]),
                SizedBox(height: 20, width: 10),
                ExpansionTile(
                    title: Row(children: [
                      Icon(Icons.star, size: 21),
                      SizedBox(height: 30, width: 10),
                      Text('Texto', style: TextStyle(color: Colors.black)),
                    ]),
                    children: [
                      ListTile(
                          title: Text('Texto', style: TextStyle(height: 1.4))),
                    ]),
                SizedBox(height: 20, width: 10),
                ExpansionTile(
                    title: Row(children: [
                      SizedBox(height: 30, width: 2),
                      Icon(FontAwesomeIcons.chartColumn, size: 19),
                      SizedBox(height: 30, width: 10),
                      Text('Texto', style: TextStyle(color: Colors.black)),
                    ]),
                    children: [
                      ListTile(
                          title: Text('Texto', style: TextStyle(height: 1.4))),
                    ])
              ])),
        ] else ...[
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Column(children: [
                ExpansionTile(
                    title: Row(children: [
                      SizedBox(height: 30, width: 2),
                      Icon(FontAwesomeIcons.chartColumn, size: 19),
                      SizedBox(height: 30, width: 10),
                      Text('Texto', style: TextStyle(color: Colors.black)),
                    ]),
                    children: [
                      ListTile(
                          title: Text('Texto', style: TextStyle(height: 1.4)))
                    ]),
                SizedBox(height: 20, width: 10),
                ExpansionTile(
                    title: Row(children: [
                      Icon(Icons.airplanemode_active, size: 21),
                      SizedBox(height: 30, width: 10),
                      Text('Texto', style: TextStyle(color: Colors.black)),
                    ]),
                    children: [
                      ListTile(
                          title: Text('Texto', style: TextStyle(height: 1.4))),
                    ]),
                SizedBox(height: 20, width: 10),
                ExpansionTile(
                    title: Row(children: [
                      Icon(Icons.star, size: 21),
                      SizedBox(height: 30, width: 10),
                      Text('Texto', style: TextStyle(color: Colors.black)),
                    ]),
                    children: [
                      ListTile(
                          title: Text('Texto', style: TextStyle(height: 1.4))),
                    ]),
                SizedBox(height: 20, width: 10),
                ExpansionTile(
                    title: Row(children: [
                      SizedBox(height: 30, width: 2),
                      Icon(FontAwesomeIcons.chartColumn, size: 19),
                      SizedBox(height: 30, width: 10),
                      Text('Texto', style: TextStyle(color: Colors.black)),
                    ]),
                    children: [
                      ListTile(
                          title: Text('Texto', style: TextStyle(height: 1.4))),
                    ])
              ]))
        ]
      ],
    );
  }
}
