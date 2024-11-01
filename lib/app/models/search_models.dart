class SearchModel {
  final int id;
  final String nome;
  final String url;

  SearchModel({
    required this.id,
    required this.nome,
    required this.url,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      SearchModel(id: json["id"], nome: json["nome"], url: json["url"]);
}

class SearchResponse {
  final List<SearchModel?> content;
  final int totalPages;
  final int totalElements;
  final int itemsPerPage;
  final int currentPage;
  bool? last;
  int? size;
  int? number;
  bool? first;
  bool? empty;

  SearchResponse({
    required this.content,
    required this.totalPages,
    required this.totalElements,
    required this.itemsPerPage,
    required this.currentPage,
    this.last,
    this.size,
    this.number,
    this.first,
    this.empty,
  });
}

int convertToInt(Object? value) {
  return int.parse(value.toString());
}
