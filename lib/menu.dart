
// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "HOME", child: Text(" HOME ")),
    const DropdownMenuItem(value: "Item 1", child: Text("Item 1")),
    const DropdownMenuItem(value: "Item 2", child: Text("Item 2")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems1{
  List<DropdownMenuItem<String>> menuItems = [
    if (selValue == "ABOUT US")...{
      const DropdownMenuItem(value: "ABOUT US", child: Text(" SOBRE NÓS ", style: TextStyle(color: Colors.blue))),
    } else...{
      const DropdownMenuItem(value: "ABOUT US", child: Text(" SOBRE NÓS ")),
    }
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems2{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "SERVICES", child: Text(" SERVICES ")),
    const DropdownMenuItem(value: "Item 1", child: Text("Item 1")),
    const DropdownMenuItem(value: "Item 2", child: Text("Item 2")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems3{
  List<DropdownMenuItem<String>> menuItems = [
    if (selValue == "BLOG")...{
      const DropdownMenuItem(value: "BLOG", child: Text(" PUBLICAÇÕES ", style: TextStyle(color: Colors.blue))),
      DropdownMenuItem(value: "Item 1", child: TextButton(child: const Text("Item 1"), onPressed: () {})),
      const DropdownMenuItem(value: "Item 2", child: Text("Item 2")),
    } else...{
      const DropdownMenuItem(value: "BLOG", child: Text(" PUBLICAÇÕES ")),
      DropdownMenuItem(value: "Item 1", child: TextButton(child: const Text("Item 1"), onPressed: () {})),
      const DropdownMenuItem(value: "Item 2", child: Text("Item 2")),
    }
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems4{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "PAGES", child: Text(" PAGES ")),
    const DropdownMenuItem(value: "Item 1", child: Text("Item 1")),
    const DropdownMenuItem(value: "Item 2", child: Text("Item 2")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems5{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "SHOP", child: Text(" SHOP ")),
    const DropdownMenuItem(value: "Item 1", child: Text("Item 1")),
    const DropdownMenuItem(value: "Item 2", child: Text("Item 2")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems6{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "CONTACT", child: Text(" CONTACT ")),
    const DropdownMenuItem(value: "Item 1", child: Text("Item 1")),
    const DropdownMenuItem(value: "Item 2", child: Text("Item 2")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems7{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "SRC", child: Icon(Icons.search)),
  ];
  return menuItems;
}

List <String> selValue = ["HOME", "ABOUT US", "SERVICES", "BLOG", "PAGES", "SHOP", "CONTACT", "SRC"];

  @override
  Widget MenuBar0(BuildContext context) {
    return DropdownButton(
        value: selValue[0],
        icon: const SizedBox.shrink(),  
        underline: const SizedBox(),
        onChanged: (String? newValue){
        (() {
          selValue[0] = newValue!;
        });
      },
        items: dropdownItems
    );
}

  @override
  Widget MenuBar1(BuildContext context) {
    return DropdownButton(
        value: selValue[1],
        icon: const SizedBox.shrink(),  
        underline: const SizedBox(),
        onChanged: (String? newValue){
        (() {
          selValue[1] = newValue!;
        });
      },
        items: dropdownItems1
    );
}

  @override
  Widget MenuBar2(BuildContext context) {
    return DropdownButton(
        value: selValue[2],
        icon: const SizedBox.shrink(),  
        underline: const SizedBox(),
        onChanged: (String? newValue){
        (() {
          selValue[2] = newValue!;
        });
      },
        items: dropdownItems2
    );
}

  @override
  Widget MenuBar3(BuildContext context) {
    return DropdownButton(
        value: selValue[3],
        icon: const SizedBox.shrink(),  
        underline: const SizedBox(),
        onChanged: (String? newValue){
        (() {
          selValue[3] = newValue!;
        });
      },
        items: dropdownItems3
    );
}

  @override
  Widget MenuBar4(BuildContext context) {
    return DropdownButton(
        value: selValue[4],
        icon: const SizedBox.shrink(),  
        underline: const SizedBox(),
        onChanged: (String? newValue){
        (() {
          selValue[4] = newValue!;
        });
      },
        items: dropdownItems4
    );
}

  @override
  Widget MenuBar5(BuildContext context) {
    return DropdownButton(
        value: selValue[5],
        icon: const SizedBox.shrink(),  
        underline: const SizedBox(),
        onChanged: (String? newValue){
        (() {
          selValue[5] = newValue!;
        });
      },
        items: dropdownItems5
    );
}

  @override
  Widget MenuBar6(BuildContext context) {
    return DropdownButton(
        value: selValue[6],
        icon: const SizedBox.shrink(),  
        underline: const SizedBox(),
        onChanged: (String? newValue){
        (() {
          selValue[6] = newValue!;
        });
      },
        items: dropdownItems6
    );
}

  @override
  Widget MenuBar7(BuildContext context) {
    return DropdownButton(
        value: selValue[7],
        icon: const SizedBox.shrink(),  
        underline: const SizedBox(),
        onChanged: (String? newValue){
        (() {
          selValue[7] = newValue!;
        });
      },
        items: dropdownItems7
    );
}