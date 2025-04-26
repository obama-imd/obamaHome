import 'package:obamahome/auth/controller.dart';

class ItemValue {
  List<String?> subItems;
  final List<bool> subItemHover;
  bool itemHover;
  final String name;
  final List<String> path;
  final List<String>? gifPath;
  final List<String>? subGifPath;
  final Function? action;

  ItemValue(
      {required this.subItems,
      required this.subItemHover,
      required this.name,
      required this.itemHover,
      required this.path,
      this.gifPath,
      this.subGifPath,
      this.action = null});
}

List<ItemValue> getItemValues() {
  return [
    ItemValue(
      name: "Início",
      path: ['/'],
      gifPath: ["assets/images/gifs/inicio.gif"],
      subItems: [],
      itemHover: false,
      subItemHover: List.generate(1, (index) => false),
    ),
    ItemValue(
      name: "Sobre",
      path: ['/sobre'],
      gifPath: ["assets/images/gifs/sobre.gif"],
      subItems: [],
      itemHover: false,
      subItemHover: List.generate(1, (index) => false),
    ),
    ItemValue(
      name: "Serviços",
      path: ['/objetos-aprendizagem', '/trilhas', '/manuais'],
      gifPath: ["assets/images/gifs/servicos.gif"],
      subItems: ["OA", "Trilhas", "Manuais"],
      subGifPath: [
        "assets/images/gifs/objeto-aprendizagem.gif",
        "assets/images/gifs/trilhas.gif",
        "assets/images/gifs/manuais.gif"
      ],
      itemHover: false,
      subItemHover: List.generate(3, (index) => false),
    ),
    ItemValue(
      name: "Publicações",
      path: ['/publicacoes'],
      gifPath: ["assets/images/gifs/publicacoes.gif"],
      // path: ['/publicacoes', '/publicacao-detalhe'],
      subItems: [],
      // subItems: ["Lista de Publicações", "Última publicação"],
      itemHover: false,
      subItemHover: List.generate(2, (index) => false),
    ),
    ItemValue(
      name: "Formações",
      path: ['/formacoes'],
      gifPath: ["assets/images/gifs/formacoes.gif"],
      subItems: [],
      itemHover: false,
      subItemHover: List.generate(1, (index) => false),
    ),
    hasUserSession
        ? ItemValue(
            name: "Planos de Aula",
            path: ['/planos-aulas/lista', '/planos-aulas/criar'],
            gifPath: ["assets/images/gifs/plano-aula.gif"],
            subItems: ['Lista', 'Criar um novo'],
            subGifPath: [
              "assets/images/gifs/plano-aula-listar.gif",
              "assets/images/gifs/plano-aula-novo.gif"
            ],
            itemHover: false,
            subItemHover: List.generate(2, (index) => false),
          )
        : null
  ]
      .where((e) => e != null) // removendo os itens nulos
      .map((item) => item!)
      .toList();
}
