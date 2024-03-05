// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemProduto extends StatelessWidget {
  String titulo;
  String descricao;
  String imagem;

  ItemProduto(this.titulo, this.descricao, this.imagem,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            "assets/images/"+imagem,
            width: 100,
            fit: BoxFit.contain,
          ),
          if (titulo != "") ...{
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                titulo,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          },
          if (titulo != "") ...{
            Text(
              descricao,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          },
        ],
      ),
    );
  }
}
