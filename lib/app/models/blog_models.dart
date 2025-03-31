import 'dart:convert';

class BlogModel {
  String title;
  int year;
  String summary;
  String authors;
  String link;
  String type;
  bool awarded;

  BlogModel({
    required this.title,
    required this.year,
    required this.summary,
    required this.authors,
    required this.link,
    required this.type,
    required this.awarded,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'year': year,
      'summary': summary,
      'authors': authors,
      'link': link,
      'type': type,
      'awarded': awarded,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      title: map['title'],
      year: map['year'],
      summary: map['summary'],
      authors: map['authors'],
      link: map['link'],
      type: map['type'],
      awarded: map['awarded'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  // Criando objeto a partir de JSON
  factory BlogModel.fromJson(String source) =>
      BlogModel.fromMap(json.decode(source));

  // Função para converter lista de JSON em lista de BlogModel
  static List<BlogModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => BlogModel.fromMap(item)).toList();
  }
}

// String extractImagePath(String content) {
//   final document = parse(content);
//   final imgElement = document.getElementsByTagName('img').last;
//   final result = imgElement.attributes['src'];
//   return result!;
// }

// String extractSummaryPath(String summary) {
//   final document = parse(summary);
//   final sumElement = document.getElementsByTagName('p').last;
//   final sumValue = sumElement.text;
//   return sumValue;
// }

// String convertDate(String date) {
//   DateTime dateTime = DateTime.parse(date);
//   String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
//   return formattedDate;
// }

