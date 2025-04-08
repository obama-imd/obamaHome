import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/blog_models.dart';

Future<dynamic> fetchJsonData(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Falha ao carregar conteúdo de $url');
  }
}

Future<List<BlogModel>> fetchPublications() async {
  final url =
      'https://raw.githubusercontent.com/amandamaria/imagens-oas/refs/heads/main/publications.json';

  try {
    final jsonData = await fetchJsonData(url);

    if (jsonData.containsKey('content') && jsonData['content'] is List) {
      return BlogModel.fromJsonList(jsonData['content']);
    } else {
      throw Exception('Formato de JSON inválido');
    }
  } catch (e) {
    print('Erro: $e');
    return [];
  }
}

List<BlogModel> filtrarPosts(List<BlogModel> jsonData, String searchTerm) {
  if (searchTerm.isEmpty) {
    return jsonData;
  }

  return jsonData.where((item) {
    final title = item.title.toString().toLowerCase();
    final year = item.year.toString().toLowerCase();
    final summary = item.summary.toString().toLowerCase();
    final authors = item.authors.toString().toLowerCase();

    return title.contains(searchTerm.toLowerCase()) ||
        title.contains(searchTerm.toLowerCase()) ||
        year.contains(searchTerm.toLowerCase()) ||
        summary.contains(searchTerm.toLowerCase()) ||
        authors.contains(searchTerm.toLowerCase());
  }).toList();
}

final blogPosts = StateProvider<List<BlogModel?>>((ref) {
  return [];
});

class BlogController {
  Future<List<BlogModel?>> updateBlogContent(String searchTerm) async {
    List<BlogModel> updatedPosts = await fetchPublications();
    final List<BlogModel> postsFiltrados =
        filtrarPosts(updatedPosts, searchTerm);

    return postsFiltrados;
  }
}
