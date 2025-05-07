class LessonPlan {
  LessonPlan({required this.id, required this.title, required this.status});

  int id;
  String title;
  String status;

  factory LessonPlan.fromJson(Map<String, dynamic> json) {
    return LessonPlan(
        id: json['id'], title: json['titulo'], status: json['status']);
  }
}

class LessonPlanModel {
  String escola;
  int idNivelEnsino;
  List<int> disciplinasEnvolvida = [1];
  int idAnoEnsino;
  int duracaoEmMinutos;
  String titulo;
  String autores;
  String metodologia;
  String objetivosEspecificos;
  String objetivoGeral;
  String avaliacao;
  String referencias;

  LessonPlanModel(
      {required this.escola,
      required this.idNivelEnsino,
      required this.disciplinasEnvolvida,
      required this.idAnoEnsino,
      required this.duracaoEmMinutos,
      required this.titulo,
      required this.autores,
      required this.metodologia,
      required this.objetivosEspecificos,
      required this.objetivoGeral,
      required this.avaliacao,
      required this.referencias});

  Map<String, dynamic> toJson() {
    return {
      "escola": escola,
      "id_nivel_ensino": idNivelEnsino,
      "disciplinas_envolvidas": disciplinasEnvolvida,
      "id_ano_ensino": idAnoEnsino,
      "duracao_em_minutos": duracaoEmMinutos,
      "titulo": titulo,
      "autores": autores,
      "metodologia": metodologia,
      "objetivos_especificos": objetivosEspecificos,
      "objetivo_geral": objetivoGeral,
      "avaliacao": avaliacao,
      "referencias": referencias
    };
  }
}
