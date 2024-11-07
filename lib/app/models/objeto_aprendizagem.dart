class ObjetoAprendizagem {
  String nome;
  String descricao;
  dynamic dataLancamento;
  List<AutoresMantenedore>? autoresMantenedores;
  List<Descritor>? descritores;
  List<Habilidade>? habilidades;
  List<Acesso>? acessos;

  ObjetoAprendizagem({
    required this.nome,
    required this.descricao,
    required this.dataLancamento,
    required this.autoresMantenedores,
    required this.descritores,
    required this.habilidades,
    required this.acessos,
  });

  factory ObjetoAprendizagem.fromJson(Map<String, dynamic> json) {
    return ObjetoAprendizagem(
        nome: json['nome'],
        descricao: json['descricao'],
        dataLancamento: json['dataLancamento'],
        autoresMantenedores: json['autoresMantenedores'],
        descritores: List<Descritor>.from(
            json['descritores'].map((model) => Descritor.fromJson(model))),
        habilidades: List<Habilidade>.from(
            json['habilidades'].map((model) => Habilidade.fromJson(model))),
        acessos: List<Acesso>.from(
            json['acessos'].map((model) => Acesso.fromJson(model))));
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
  String nome;
  String email;
  String site;

  AutoresMantenedore({
    required this.id,
    required this.nome,
    required this.email,
    required this.site,
  });
}

class Descritor {
  int id;
  String descricao;
  String codigo;
  TemaConteudo temaConteudo;
  NivelEnsino nivelEnsino;

  Descritor({
    required this.id,
    required this.descricao,
    required this.codigo,
    required this.temaConteudo,
    required this.nivelEnsino,
  });

  factory Descritor.fromJson(Map<String, dynamic> json) {
    return Descritor(
        id: json['id'],
        descricao: json['descricao'],
        codigo: json['codigo'],
        temaConteudo: TemaConteudo.fromJson(json['temaConteudo'], 'PCN'),
        nivelEnsino: NivelEnsino.fromJson(json['nivelEnsino']));
  }

  @override
  String toString() {
    return '${nivelEnsino.nome} - $codigo: $descricao';
  }
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
  String descricao;
  String conhecimentos;
  String codigo;
  TemaConteudo temaConteudo;
  AnoEnsino anoEnsino;

  Habilidade({
    required this.id,
    required this.descricao,
    required this.conhecimentos,
    required this.codigo,
    required this.temaConteudo,
    required this.anoEnsino,
  });

  factory Habilidade.fromJson(Map<String, dynamic> json) {
    return Habilidade(
        id: json['id'],
        descricao: json['descricao'],
        conhecimentos: json['conhecimentos'],
        codigo: json['codigo'],
        temaConteudo: TemaConteudo.fromJson(json['temaConteudo'], 'BNCC'),
        anoEnsino: AnoEnsino.fromJson(json['anoEnsino']));
  }
  @override
  String toString() {
    return '${anoEnsino.nivelEnsino.nome} - $codigo: $descricao';
  }
}

class AnoEnsino {
  int id;
  String nome;
  NivelEnsino nivelEnsino;

  AnoEnsino({
    required this.id,
    required this.nome,
    required this.nivelEnsino,
  });

  factory AnoEnsino.fromJson(Map<String, dynamic> json) {
    return AnoEnsino(
        id: json['id'],
        nome: json['nome'],
        nivelEnsino: NivelEnsino.fromJson(json['nivelEnsino']));
  }
}
