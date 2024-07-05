import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/advanced_search/domain/study_level.dart';

class StudyLevelRepo {
  final _url = 'http://127.0.0.1:5000/v1/nivelensino';

  Future<List<StudyLevelModel>> findAll() async {
    List<StudyLevelModel> levels = [];
    final response = await http.get(Uri.parse(_url));
    if(response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      for (var data in responseData) {
      levels.add(StudyLevelModel.fromJson(data));
      }
      return levels;
    }
    else {
      return [];
    }
  }
}

final studyLevelProvider = Provider<StudyLevelRepo> (
  (ref) => StudyLevelRepo(),
);