import '../../../../components/menuClass.dart';

List<ItemValue> getEditorValues(Function action) {
  return [
    ItemValue(
      name: "Voltar",
      path: ['/'],
      gifPath: [],
      subItems: [],
      itemHover: false,
      subItemHover: List.generate(1, (index) => false),
    ),
    ItemValue(
        name: "Salvar",
        path: [""],
        gifPath: [],
        subItems: [],
        itemHover: false,
        subItemHover: List.generate(1, (index) => false),
        action: action),
  ];
}
