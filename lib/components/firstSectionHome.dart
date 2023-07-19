// ignore: file_names
import 'package:flutter/material.dart';

class ItemProduto extends StatelessWidget {
  String titulo;
  String descricao;
  String imagem;

  ItemProduto(this.titulo, this.descricao, this.imagem);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.00),
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
              flex: 8,
              child: Image.asset("images/${this.imagem}",
              fit:  BoxFit.contain,
              ),
          ),
          Expanded(
           flex: 1,
           child: Text('${this.titulo}'),
          ),
          Expanded(
            flex: 1,
            child: Text('${this.descricao}'),
          ),
        ],
      ),
    );
  }
}
