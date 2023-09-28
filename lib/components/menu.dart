import 'package:flutter/material.dart';
import 'package:obamahome/components/blog-details.dart';
import 'package:obamahome/pages/blog/blog.dart';

import '../pages/about-us/aboutUs.dart';
import '../pages/home/home.dart';

List<String> selValue = [
  "HOME",
  "SOBRE",
  "SERVIÇOS",
  "PUBLICAÇÕES",
  "PAGES",
  "PLANOS DE AULA",
  "SRC"
];

List<dynamic> selValueContent = [
  const Text("HOME"),
  const Text("SOBRE"),
  const Text("SERVIÇOS"),
  const Text("PUBLICAÇÕES"),
  const Text("PAGES"),
  const Text("PLANOS DE AULA"),
  const Icon(Icons.search)
];

// List<itemValue> itemKeys = [
//     'itemsHome',
//     'itemsBoutUs',
//     'itemsServices',
//     'itemsBlog',
//     'itemsPages',
//     'itemsShop',
//     'itemsContact',
// ];

class itemValue {
  final List<String>? itemsHome;
  final List<String>? itemsBoutUs;
  final List<String>? itemsServices;
  final List<String>? itemsBlog;
  final List<String>? itemsPages;
  final List<String>? itemsShop;
  // final List<String>? itemsSearch;

  itemValue({
    this.itemsHome,
    this.itemsBoutUs,
    this.itemsServices,
    this.itemsBlog,
    this.itemsPages,
    this.itemsShop,
    // this.itemsSearch,
  });
}

final List<itemValue> itemValues = [
  itemValue(
    itemsHome: ["Item 1", "Item 2"],
    itemsBoutUs: ["Sobre"],
    itemsServices: ["Item 1", "Item 2"],
    itemsBlog: ["Item 1", "Item 2"],
    itemsPages: ["Item 1", "Item 2"],
    itemsShop: ["Item 1", "Item 2"],
    // itemsSearch: ["Item 1", "Item 2"],
  )
];

List<dynamic> navigateTo = [
  const HomePage(),
  const AboutUsPage(),
  ServicesPage(),
  const BlogPage(),
  PagesPage(),
  ShopPage(),
  SearchPage(),
];

List<DropdownMenuItem<String>> getDropdownItems(
  BuildContext context,
  String label,
  int index,
  dynamic content,
) {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: label, child: content),
    if (index == 0) ...{
      for (int j = 0; j < itemValues[0].itemsHome!.length; j++) ...{
        DropdownMenuItem(
            value: itemValues[0].itemsHome![j],
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => navigateTo[index]));
                },
                child: Text(itemValues[0].itemsHome![j]))),
      }
    } else if (index == 1) ...{
      for (int j = 0; j < itemValues[0].itemsBoutUs!.length; j++) ...{
        DropdownMenuItem(
            value: itemValues[0].itemsBoutUs![j],
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => navigateTo[index]));
                },
                child: Text(itemValues[0].itemsBoutUs![j].toUpperCase())))
      }
    } else if (index == 2) ...{
      for (int j = 0; j < itemValues[0].itemsServices!.length; j++) ...{
        DropdownMenuItem(
            value: itemValues[0].itemsServices![j],
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => navigateTo[index]));
                },
                child: Text(itemValues[0].itemsServices![j])))
      }
    } else if (index == 3) ...{
      for (int j = 0; j < itemValues[0].itemsBlog!.length; j++) ...{
        DropdownMenuItem(
            value: itemValues[0].itemsBlog![j],
            child: InkWell(
                onTap: () {
                  if (j == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => navigateTo[index]));
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlogDetails()));
                  }
                },
                child: Text(itemValues[0].itemsBlog![j])))
      }
    } else if (index == 4) ...{
      for (int j = 0; j < itemValues[0].itemsPages!.length; j++) ...{
        DropdownMenuItem(
            value: itemValues[0].itemsPages![j],
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => navigateTo[index]));
                },
                child: Text(itemValues[0].itemsPages![j])))
      }
    } else if (index == 5) ...{
      for (int j = 0; j < itemValues[0].itemsShop!.length; j++) ...{
        DropdownMenuItem(
            value: itemValues[0].itemsShop![j],
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => navigateTo[index]));
                },
                child: Text(itemValues[0].itemsShop![j])))
      }
    }
  ];
  return menuItems;
}

Widget MenuBar0(BuildContext context, int index, String label, dynamic content) {
  return DropdownButton(
    value: label,
    icon: const SizedBox.shrink(),
    underline: const SizedBox(),
    onChanged: (String? newValue) {
      () {
        label = newValue!;
      };
    },
    items: getDropdownItems(context, label, index, content),
  );
}

@override
Widget navBarMenu(BuildContext context, double swidth) {
  return SizedBox(
    width: swidth * 0.45,
    child: Row(children: [
      for (int i = 0; i < selValue.length; i++) ...{
        Container(
            padding: const EdgeInsets.all(9.2),
            child: MenuBar0(context, i, selValue[i], selValueContent[i])),
      }
    ]),
  );
}

class SearchPage {}

class ContactPage {}

class ShopPage {}

class PagesPage {}

class ServicesPage {}
