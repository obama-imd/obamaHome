import 'dart:convert';

class ObjetoAprendizagem {
  String nome;
  String descricao;
  String? dataLancamento;
  List<AutoresMantenedore>? autoresMantenedores;
  List<DescritorOA>? descritores;
  List<HabilidadeOA>? habilidades;
  List<Acesso>? acessos;

  ObjetoAprendizagem({
    required this.nome,
    required this.descricao,
    this.dataLancamento,
    required this.autoresMantenedores,
    required this.descritores,
    required this.habilidades,
    required this.acessos,
  });

  factory ObjetoAprendizagem.fromJson(Map<String, dynamic> json) {
    return ObjetoAprendizagem(
        nome: json['nome'],
        descricao: json['descricao'],
        dataLancamento: json['data_Lancamento'],
        autoresMantenedores: (json['autores_mantenedores'] as List?)
                ?.map((item) => AutoresMantenedore.fromMap(item))
                .toList() ??
            [],
        descritores: (json['descritores'] as List?)
                ?.map((model) =>
                    DescritorOA.fromJson(Map<String, dynamic>.from(model)))
                .toList() ??
            [],
        habilidades: (json['habilidades'] as List?)
                ?.map((model) =>
                    HabilidadeOA.fromJson(Map<String, dynamic>.from(model)))
                .toList() ??
            [],
        acessos: (json['acessos'] as List?)
                ?.map((model) =>
                    Acesso.fromJson(Map<String, dynamic>.from(model)))
                .toList() ??
            []);
  }

  String getLink() {
    return acessos?.first.link ?? "Inválid link";
  }

  String getPlataforma() {
    return acessos?.first.tipoAcesso.nome ?? "-";
  }

  String getAuthor() {
    return autoresMantenedores!.map((e) => {e.nome}).join(", ");
  }

  String getDescritores() {
    var result = descritores!.map((e) => e.toString()).join("\n");
    if (result.isEmpty) {
      result = "Não identificado";
    }
    return result;
  }

  String getHabilidades() {
    var result = habilidades!.map((e) => e.toString()).join("\n");
    if (result.isEmpty) {
      result = "Não identificado";
    }
    return result;
  }
}

enum TipoAcesso {
  DISPOSITIVO_MOVEL,
  WEB,
  EXECUTAVEL;

  static TipoAcesso fromJson(String json) => values.byName(json);

  String get nome {
    switch (this) {
      case DISPOSITIVO_MOVEL:
        return 'ANDROID ';
      case WEB:
        return 'WEB';
      case EXECUTAVEL:
        return 'WINDOWS';
    }
  }
}

class Acesso {
  TipoAcesso tipoAcesso;
  String link;
  Plataforma plataforma;

  Acesso({
    required this.tipoAcesso,
    required this.link,
    required this.plataforma,
  });

  factory Acesso.fromJson(Map<String, dynamic> json) {
    return Acesso(
        tipoAcesso: TipoAcesso.fromJson(json['tipoAcesso']),
        link: json['link'],
        plataforma: Plataforma.fromJson(json['plataforma']));
  }
}

class Plataforma {
  int id;
  String nome;

  Plataforma({
    required this.id,
    required this.nome,
  });

  factory Plataforma.fromJson(Map<String, dynamic> json) {
    return Plataforma(id: json['id'], nome: json['nome']);
  }
}

class AutoresMantenedore {
  int id;
  String? nome;
  String? email;
  String? site;

  AutoresMantenedore({
    required this.id,
    this.nome,
    this.email,
    this.site,
  });

  factory AutoresMantenedore.fromMap(Map<String, dynamic> map) {
    return AutoresMantenedore(
        id: map['id'] ?? 0,
        nome: map['nome'] ?? '',
        email: map['email'] ?? '',
        site: map['site'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'site': site,
    };
  }

  factory AutoresMantenedore.fromJson(String source) =>
      AutoresMantenedore.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}

class Descritor {
  int id;
  String descricao;
  String codigo;
  String temaConteudo;
  String nivelEnsino;

  Descritor({
    required this.id,
    required this.descricao,
    required this.codigo,
    required this.temaConteudo,
    required this.nivelEnsino,
  });

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'codigo': codigo,
      'nome_tema_conteudo': temaConteudo,
      'nome_nivel_ensino': nivelEnsino,
    };
  }

  factory Descritor.fromMap(Map<String, dynamic> map) {
    return Descritor(
      id: map['id'],
      descricao: map['descricao'],
      codigo: map['codigo'],
      temaConteudo: map['nome_tema_conteudo'],
      nivelEnsino: map['nome_nivel_ensino'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Descritor.fromJson(String source) =>
      Descritor.fromMap(json.decode(source));

  static List<Descritor> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => Descritor.fromMap(item)).toList();
  }

  String get formattedDescricao => '${nivelEnsino} - $codigo: $descricao';
  (int, String) get asTuple => (id, formattedDescricao);

  (int, String) tointString() => asTuple;
}

class DescritorOA {
  int id;
  String descricao;
  String codigo;
  String temaConteudo;
  String nivelEnsino;

  DescritorOA({
    required this.id,
    required this.descricao,
    required this.codigo,
    required this.temaConteudo,
    required this.nivelEnsino,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'codigo': codigo,
      'nome_tema_conteudo': temaConteudo,
      'nome_nivel_ensino': nivelEnsino,
    };
  }

  factory DescritorOA.fromMap(Map<String, dynamic> map) {
    return DescritorOA(
      id: map['id'],
      descricao: map['descricao'],
      codigo: map['codigo'],
      temaConteudo: map['temaConteudo']['nome'],
      nivelEnsino: map['nivelEnsino']['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DescritorOA.fromJson(Map<String, dynamic> json) =>
      DescritorOA.fromMap(json);

  static List<DescritorOA> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => DescritorOA.fromMap(item)).toList();
  }

  String get formattedDescricao => '$nivelEnsino - $codigo: $descricao';

  @override
  String toString() => formattedDescricao;
}

class NivelEnsino {
  int id;
  String nome;

  NivelEnsino({required this.id, required this.nome});

  factory NivelEnsino.fromJson(Map<String, dynamic> json) {
    return NivelEnsino(id: json['id'], nome: json['nome']);
  }
}

class TemaConteudo {
  int id;
  String nome;
  String curriculo;

  TemaConteudo({
    required this.id,
    required this.nome,
    required this.curriculo,
  });

  factory TemaConteudo.fromJson(Map<String, dynamic> json, String curriculo) {
    return TemaConteudo(
        id: json['id'], nome: json['nome'], curriculo: curriculo);
  }

  String getNomeWithCurriculo() {
    return '$curriculo - $nome';
  }
}

class Disciplina {
  int id;
  String nome;

  Disciplina({required this.id, required this.nome});

  factory Disciplina.fromJson(Map<String, dynamic> json) {
    return Disciplina(id: json['id'], nome: json['nome']);
  }
}

enum Curriculo { BNCC, PCN }

class Habilidade {
  int id;
  String codigo;
  String descricao;
  String nomeAnoEnsino;

  Habilidade({
    required this.id,
    required this.codigo,
    required this.descricao,
    required this.nomeAnoEnsino,
  });

  factory Habilidade.fromJson(Map<String, dynamic> json) {
    return Habilidade(
      id: json['id'],
      codigo: json['codigo'],
      descricao: json['descricao'],
      nomeAnoEnsino: json['nome_ano_ensino'],
    );
  }

  String get formattedHabilidade => '$nomeAnoEnsino - $codigo: $descricao';
  (int, String) get asTuple => (id, formattedHabilidade);

  (int, String) tointString() => asTuple;
}

class HabilidadeOA {
  int id;
  String codigo;
  String descricao;
  String nomeAnoEnsino;

  HabilidadeOA({
    required this.id,
    required this.codigo,
    required this.descricao,
    required this.nomeAnoEnsino,
  });

  factory HabilidadeOA.fromJson(Map<String, dynamic> json) {
    return HabilidadeOA(
      id: json['id'],
      codigo: json['codigo'] ?? '',
      descricao: json['descricao'] ?? '',
      nomeAnoEnsino: json['anoEnsino']?['nome'] ?? '',
    );
  }

  String get formattedHabilidade => '$nomeAnoEnsino - $codigo: $descricao';
  @override
  String toString() => formattedHabilidade;
}

class AnoEnsino {
  int id;
  String nome;
  // NivelEnsino nivelEnsino;

  AnoEnsino({
    required this.id,
    required this.nome,
    // required this.nivelEnsino,
  });

  factory AnoEnsino.fromJson(Map<String, dynamic> json) {
    return AnoEnsino(id: json['id'], nome: json['nome']);
    // nivelEnsino: NivelEnsino.fromJson(json['nivelEnsino']));
  }
}
