import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<dynamic> fetchContents(String url) async {
  final headers = {
    'Content-Type': 'application/json',
    HttpHeaders.accessControlAllowOriginHeader: url,
    'accept': 'application/json'
  };

  final response = await http.get(
    Uri.parse(url),
    headers: headers,
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Falha ao carregar conteúdo de $url');
  }
}

Future<void> getBlogContent() async {
  final repo = 'obama-imd/obamaHome';
  final baseUrl = 'https://api.github.com/repos/$repo/contents';

  try {
    final contents = await fetchContents(baseUrl);

    if (contents is List) {
      List<Map<String, dynamic>> repoData = [];
      List<Future<Map<String, dynamic>>> fileRequests = [];

      for (var item in contents) {
        if (item['type'] == 'file') {
          fileRequests.add(
            fetchContents(item['url']).then((fileData) {
              String base64Content = fileData['content'].replaceAll('\n', '');
              String decodedContent = utf8.decode(base64.decode(base64Content));

              return {'path': item['path'], 'content': decodedContent};
            }),
          );
        }
      }

      repoData = await Future.wait(fileRequests);
      print(jsonEncode(repoData));
    } else {
      print('Erro: Resposta inesperada da API do GitHub');
    }
  } catch (e) {
    print('Erro: $e');
  }
}
