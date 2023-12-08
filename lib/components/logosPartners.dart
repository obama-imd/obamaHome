import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PartnersLogos extends StatelessWidget {
  String imagem;

  PartnersLogos(this.imagem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 6, color: const Color.fromARGB(255, 231, 228, 228))),
        child: Image(
            image: AssetImage(imagem), height: 110));
  }
}
