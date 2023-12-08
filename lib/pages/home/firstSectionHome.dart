// ignore: file_names
import 'package:flutter/material.dart';

class ItemProduto extends StatelessWidget {
  String titulo;
  String descricao;
  String imagem;

  ItemProduto(this.titulo, this.descricao, this.imagem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset("assets/images/$imagem",
          width: 100,
          fit:  BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Text(titulo,
             style: const TextStyle( fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Text(descricao,
          style: const TextStyle( fontSize: 15, color: Color(0xFF707070),
           )),
        ],
      ),
    );
  }
}
