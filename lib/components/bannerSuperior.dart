import 'package:flutter/material.dart';

Widget BannerSuperior(context, String pageName) {
  return Container(
      child: Stack(children: <Widget>[
    Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/img.jpg'), fit: BoxFit.cover),
        )),
    Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        padding: const EdgeInsets.only(top: 85.0, left: 92.0),
        child: ListView(children: [
          Text(
            pageName,
            textScaleFactor: 3.1,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Container(
              child: Row(children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Home',
                  textScaleFactor: 1.11,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )),
            const Text(
              '>  ',
              textScaleFactor: 1.11,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              pageName,
              textScaleFactor: 1.11,
              style: TextStyle(color: Colors.white),
            ),
          ]))
        ]))
  ]));
}
