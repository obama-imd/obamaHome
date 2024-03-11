import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class mainContainer extends StatelessWidget {
  final dynamic content;
  const mainContainer({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(margin: paddingValues("sectionPadding", context), child: Column(
      children: [
        content
      ],
    ));
  }
}