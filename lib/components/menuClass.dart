class ItemValue {
  List<String?> subItems;
  final List<bool> subItemHover;
  bool itemHover;
  final String name;
  final List<String> path;

  ItemValue(
      {required this.subItems,
      required this.subItemHover,
      required this.name,
      required this.itemHover,
      required this.path});
}

final List<ItemValue> itemValues = [
  ItemValue(
    name: "Início",
    path: ['/'],
    subItems: [],
    itemHover: false,
    subItemHover: List.generate(1, (index) => false),
  ),
  ItemValue(
    name: "Sobre",
    path: ['/sobre'],
    subItems: [],
    itemHover: false,
    subItemHover: List.generate(1, (index) => false),
  ),
  ItemValue(
    name: "Serviços",
    path: ['/servicos', '/trilhas', '/manuais'],
    subItems: ["OA", "Trilhas", "Manuais"],
    itemHover: false,
    subItemHover: List.generate(3, (index) => false),
  ),
  // ItemValue(
  //   name: "Publicações",
  //   path: ['/blog', '/blog-detalhes'],
  //   subItems: ["Lista de Posts", "Último post"],
  //   itemHover: false,
  //   subItemHover: List.generate(2, (index) => false),
  // ),
  ItemValue(
    name: "Formações",
    path: ['/formacoes'],
    subItems: [],
    itemHover: false,
    subItemHover: List.generate(1, (index) => false),
  ),
  // ItemValue(
  //   name: "Planos de Aula",
  //   path: ['/planos-aulas/lista', '/planos-aulas/criar'],
  //   subItems: ['Lista', 'Criar um novo'],
  //   itemHover: false,
  //   subItemHover: List.generate(2, (index) => false),
  // ),
];
