class Description {
  int id;
  String descricao;
  String codigo;
  String nomeTemaConteudo;
  String nomeNivelEnsino;

  Description({
    required this.id,
    required this.descricao,
    required this.codigo,
    required this.nomeTemaConteudo,
    required this.nomeNivelEnsino,
  });

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      id: json['id'],
      descricao: json['descricao'],
      codigo: json['codigo'],
      nomeTemaConteudo: json['nome_tema_conteudo'],
      nomeNivelEnsino: json['nome_nivel_ensino'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'codigo': codigo,
      'nome_tema_conteudo': nomeTemaConteudo,
      'nome_nivel_ensino': nomeNivelEnsino,
    };
  }
}
