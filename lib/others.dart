import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemProduto extends StatelessWidget {
  String titulo;
  String descricao;
  String imagem;

  ItemProduto(this.titulo, this.descricao, this.imagem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(children: [
          Expanded(
            child: Image.asset(
              "images/${this.imagem}",
              width: 100,
              height: 73,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text('${this.titulo}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                Text('${this.descricao}', style: const TextStyle(fontSize: 13)),
              ],
            ),
          )
        ]));
  }
}

// ignore: must_be_immutable
class Grid1 extends StatelessWidget {
  String titulo;
  String descricao;
  IconData icone;

  Grid1(this.titulo, this.descricao, this.icone, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(children: [
          Expanded(
            child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(icone,
                    size: 39.0, color: Colors.white)),
          ),
          Expanded(
            child: Column(
              children: [
                Text('${this.titulo}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                Text('${this.descricao}', style: const TextStyle(fontSize: 13)),
              ],
            ),
          )
        ]));
  }
}
