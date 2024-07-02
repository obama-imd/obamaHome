import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:obamahome/advanced_search/domain/study_level.dart';

class StudyLevelRepo {
  final _url = 'http://localhost:8081/v1/nivelensino';

  Future<List<StudyLevelModel>> findAll() async {
    List<StudyLevelModel> levels = [];
    final response = await http.get(Uri.parse(_url));
    if(response.statusCode == 200){
      final responseJson = jsonDecode(response.body);
      // mapper de reponseJson para list levels
    }
    return levels;
  }
}

final studyLevelProvider = Provider<StudyLevelRepo> (
  (ref) => StudyLevelRepo(),
);