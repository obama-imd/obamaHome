import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/blog_models.dart';
import '../views/blog/blog_controller.dart';

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

    List<BlogModel> updatedPosts = await fetchContents();
    final List<BlogModel> postsFiltrados = filtrarPosts(updatedPosts, searchTerm);

    return postsFiltrados;
  }
}
