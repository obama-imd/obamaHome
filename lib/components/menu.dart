import 'package:flutter/material.dart';
import 'package:obamahome/components/navMenu.dart';

final TextEditingController _searchController = TextEditingController();

List<DropdownMenuItem<String>> getDropdownItems(
  BuildContext context,
  String label,
  int index,
  dynamic content,
) {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: label, child: content),
  ];
  if (index >= 0 && index < itemValues.length) {
    for (var i = 0; i < itemValues[index].subItems.length; i++) {
      menuItems.add(
        DropdownMenuItem(
          value: itemValues[index].subItems[i],
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, itemValues[index].path[i]);
            },
            child: Text(itemValues[index].subItems[i]),
          ),
        ),
      );
    }
  }
  return menuItems;
}

Widget MenuBar0(
    BuildContext context, int index, String label, dynamic content) {
  return DropdownButton(
    value: label,
    style: Theme.of(context).textTheme.headlineMedium!,
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
Widget menuItem(dynamic menuTitle) {
  return InkWell(
    mouseCursor: SystemMouseCursors.click,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: menuTitle,
    ),
  );
}