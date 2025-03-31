import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:obamahome/app/models/search_models.dart';
import 'package:obamahome/utils/apiURL.dart';

import '../models/blog_models.dart';

final blogPostsHome = StateProvider<List<BlogModel?>>((ref) {
  return [];
});

// Future<List<dynamic>> fetchPosts(WidgetRef ref) async {
//   final response = await http.get(Uri.parse('http://localhost:3000/dados'));

//   if (response.statusCode == 200) {
//     final jsonData = jsonDecode(response.body);
//     final posts = jsonData
//         .map<BlogModel>((item) => BlogModel(
//               title: item['title'],
//               text: item['text'],
//               summary: extractSummaryPath(item['summary']),
//               publishedDate: convertDate(item['published_date']),
//               imagePath: extractImagePath(item['content']),
//             ))
//         .toList() as List<BlogModel>;

//     final newPosts = ref.read(blogPostsHome);
//     newPosts.clear();
//     newPosts.addAll(posts);

//     return posts;
//   } else {
//     return [];
//   }
// }

final searchListHome = StateProvider<List<SearchModel?>>((ref) {
  return [];
});

Future<List<dynamic>> fetchObjects(WidgetRef ref) async {
  final response = await http.get(Uri.parse('$API_URL/oa'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final oas = jsonData
        .map((item) => SearchModel.fromJson(Map.from(item)))
        .toList()
        .sublist(0, 8);

    final newPosts = ref.read(searchListHome);
    newPosts.clear();
    newPosts.addAll(oas);

    return oas;
  } else {
    return [];
  }
}
