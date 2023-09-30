import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('http://localhost:3000/dados'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final datas = jsonData
        .map((item) => {
              'title': item['title'],
              'text': item['text'],
              'summary': item['summary'],
              'content': item['content'],
              'published_date': item['published_date'],
            })
        .toList()
        .reversed
        .toList()
        .sublist(0, 3);
    return datas;
  } else {
    // Handle the error here if needed.
    return [];
  }
}

String extractImagePath(String content) {
  final document = parse(content);
  final imgElement = document.getElementsByTagName('img').last;
  final result = imgElement.attributes['src'];
  return result!;
}

String extractSummaryPath(String summary) {
  final document = parse(summary);
  final sumElement = document.getElementsByTagName('p').last;
  final sumValue = sumElement.text;
  return sumValue;
}
