import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

Widget searchDropdown(context, String title, List<String?> array, titleStyle) {
  return Column(
    children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 40, bottom: 20),
          child: Text(title, style: titleStyle)),
      Container(
          height: 40,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 4),
          child: DropdownButton<String?>(
              value: array.isNotEmpty ? array.first : null,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 5,
              style: textTheme.bodySmall,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                // setState(() {
                //   dropdownValue = value!;
                // });
              },
              items: array.map<DropdownMenuItem<String?>>((String? value) {
                return DropdownMenuItem<String?>(
                  value: value,
                  child: Container(child: Text(value!)),
                );
              }).toList())),
    ],
  );
}
