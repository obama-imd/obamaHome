
import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text(" HOME "),value: "HOME"),
    DropdownMenuItem(child: Text("Item 1"),value: "Item 1"),
    DropdownMenuItem(child: Text("Item 2"),value: "Item 2"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems1{
  List<DropdownMenuItem<String>> menuItems = [
    if (selValue == "ABOUT US")...{
      DropdownMenuItem(child: Text(" SOBRE NÓS ", style: TextStyle(color: Colors.blue)),value: "ABOUT US"),
    } else...{
      DropdownMenuItem(child: Text(" SOBRE NÓS "), value: "ABOUT US"),
    }
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems2{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text(" SERVICES "),value: "SERVICES"),
    DropdownMenuItem(child: Text("Item 1"),value: "Item 1"),
    DropdownMenuItem(child: Text("Item 2"),value: "Item 2"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems3{
  List<DropdownMenuItem<String>> menuItems = [
    if (selValue == "BLOG")...{
      DropdownMenuItem(child: Text(" PUBLICAÇÕES ", style: TextStyle(color: Colors.blue)),value: "BLOG"),
      DropdownMenuItem(child: TextButton(child: Text("Item 1"), onPressed: () {}),value: "Item 1"),
      DropdownMenuItem(child: Text("Item 2"),value: "Item 2"),
    } else...{
      DropdownMenuItem(child: Text(" PUBLICAÇÕES "),value: "BLOG"),
      DropdownMenuItem(child: TextButton(child: Text("Item 1"), onPressed: () {}),value: "Item 1"),
      DropdownMenuItem(child: Text("Item 2"),value: "Item 2"),
    }
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems4{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text(" PAGES "),value: "PAGES"),
    DropdownMenuItem(child: Text("Item 1"),value: "Item 1"),
    DropdownMenuItem(child: Text("Item 2"),value: "Item 2"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems5{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text(" SHOP "),value: "SHOP"),
    DropdownMenuItem(child: Text("Item 1"),value: "Item 1"),
    DropdownMenuItem(child: Text("Item 2"),value: "Item 2"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems6{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text(" CONTACT "),value: "CONTACT"),
    DropdownMenuItem(child: Text("Item 1"),value: "Item 1"),
    DropdownMenuItem(child: Text("Item 2"),value: "Item 2"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownItems7{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Icon(Icons.search),value: "SRC"),
  ];
  return menuItems;
}

List <String> selValue = ["HOME", "ABOUT US", "SERVICES", "BLOG", "PAGES", "SHOP", "CONTACT", "SRC"];

  @override
  Widget MenuBar0(BuildContext context) {
    return DropdownButton(
        value: selValue[0],
        icon: SizedBox.shrink(),  
        underline: SizedBox(),
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
        icon: SizedBox.shrink(),  
        underline: SizedBox(),
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
        icon: SizedBox.shrink(),  
        underline: SizedBox(),
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
        icon: SizedBox.shrink(),  
        underline: SizedBox(),
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
        icon: SizedBox.shrink(),  
        underline: SizedBox(),
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
        icon: SizedBox.shrink(),  
        underline: SizedBox(),
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
        icon: SizedBox.shrink(),  
        underline: SizedBox(),
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
        icon: SizedBox.shrink(),  
        underline: SizedBox(),
        onChanged: (String? newValue){
        (() {
          selValue[7] = newValue!;
        });
      },
        items: dropdownItems7
    );
}