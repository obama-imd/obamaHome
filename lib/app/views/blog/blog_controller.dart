import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:obamahome/app/models/blog_models.dart';

Future<dynamic> fetchJsonData(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Falha ao carregar conteúdo de $url');
  }
}

Future<List<BlogModel>> fetchContents() async {
  final url =
      'https://raw.githubusercontent.com/amandamaria/imagens-oas/refs/heads/main/publications.json';

  try {
    final jsonData = await fetchJsonData(url);

    if (jsonData.containsKey('content') && jsonData['content'] is List) {
      return BlogModel.fromJsonList(jsonData['content']);
    } else {
      throw Exception('Formato de JSON inválido');
    }

    // if (jsonData is Map<String, dynamic> && jsonData.containsKey('content')) {
    //   final content = jsonData['content'];
    //   if (content is List) {
    //     final repoData = await Future.wait(content.map((item) async {
    //       if (item is Map<String, dynamic>) {
    //         if (item.containsKey('content')) {
    //           String base64Content = item['content'].replaceAll('\n', '');
    //           String decodedContent = utf8.decode(base64.decode(base64Content));
    //           return {'path': item['path'], 'content': decodedContent};
    //         }
    //         return BlogModel(
    //             title: item["title"],
    //             year: item["year"],
    //             summary: item["summary"],
    //             authors: item["authors"],
    //             link: item["link"],
    //             type: item["type"],
    //             awarded: false);
    //       }
    //       return <String, dynamic>{};
    //     }));

    //     return repoData.toList();

    //     // repoData.forEach((post) {
    //     //   print("print2 => $post");
    //     // });
    //     // print("print1 => $repoData");
    //   } else {
    //     print('Erro: "content" não é uma lista como esperado');
    //   }
    // } else if (jsonData is List) {
    //   final repoData = await Future.wait(jsonData.map((item) async {
    //     if (item is Map<String, dynamic>) {
    //       if (item.containsKey('content')) {
    //         String base64Content = item['content'].replaceAll('\n', '');
    //         String decodedContent = utf8.decode(base64.decode(base64Content));
    //         return {'path': item['path'], 'content': decodedContent};
    //       }
    //       return Map<String, dynamic>.from(item);
    //     }
    //     return <String, dynamic>{};
    //   }));
    //   print(jsonEncode({'content': repoData}));
    // } else {
    //   print('Erro: O JSON não é um objeto ou lista como esperado');
    // }
  } catch (e) {
    print('Erro: $e');
    return [];
  }
}
