import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/blog_models.dart';

Future<List<dynamic>> fetchData(String searchTerm) async {
  final response = await http.get(Uri.parse('http://localhost:3000/dados'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final postsFiltrados = filtrarPosts(jsonData, searchTerm);
    final posts = postsFiltrados
        .map((item) => {
              'title': item['title'],
              'text': item['text'],
              'summary': item['summary'],
              'content': item['content'],
              'published_date': item['published_date'],
            })
        .toList()
        .reversed
        .toList();
    return posts;
  } else {
    return [];
  }
}

List<dynamic> filtrarPosts(List<dynamic> jsonData, String searchTerm) {
  if (searchTerm.isEmpty) {
    return jsonData;
  }

  return jsonData.where((item) {
    final title = item['title'].toString().toLowerCase();
    final text = item['text'].toString().toLowerCase();
    final summary = item['summary'].toString().toLowerCase();
    final content = item['content'].toString().toLowerCase();

    return title.contains(searchTerm.toLowerCase()) ||
        text.contains(searchTerm.toLowerCase()) ||
        summary.contains(searchTerm.toLowerCase()) ||
        content.contains(searchTerm.toLowerCase());
  }).toList();
}

final seila = StateProvider<List<BlogModel?>>((ref) {
  return [];
});

class BlogController {
  Future<List<BlogModel?>> updateBlogContent(WidgetRef ref) async {

    final posts = await fetchData('');
    final filteredPosts = filtrarPosts(posts, '');
    final updatedPosts = filteredPosts
        .map((postData) => BlogModel(
              title: postData['title'],
              text: postData['text'],
              summary: extractSummaryPath(postData['summary']),
              content: postData['content'],
              publishedDate: convertDate(postData['published_date']),
              imagePath: extractImagePath(postData['content']),
            ))
        .toList();
    // print ("here => ${updatedPosts.length}");
    final newPosts = ref.read(seila);
    newPosts.addAll(updatedPosts);
    return updatedPosts;
  }
}
