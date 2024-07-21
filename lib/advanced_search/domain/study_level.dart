class StudyLevelModel {
  final int id;
  final String nome;

  StudyLevelModel({
    required this.id,
    required this.nome,
  });


  factory StudyLevelModel.fromJson(Map<String, dynamic> json) {
    return StudyLevelModel(
      id: int.parse(json['id']),
      nome: json['name'],
    );
  }
}