import 'package:flutter/material.dart';

class mainContainer extends StatelessWidget {
  final dynamic content;
  const mainContainer({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(top: 120, bottom: 115), child: Column(
      children: [
        content
      ],
    ));
  }
}