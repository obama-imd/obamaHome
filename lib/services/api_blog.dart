import 'dart:convert';

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
