import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/advanced_search/data/search_levels_repo.dart';
import 'package:obamahome/advanced_search/domain/study_level.dart';

class StudyLevelService {

  StudyLevelService({required this.ref});

  final Ref ref;
  
  Future<List<StudyLevelModel>> fetchAll() async {
    return await ref.read(studyLevelProvider).findAll();
  }
}

final studyLevelService = Provider<StudyLevelService>(
  (ref) => StudyLevelService(ref: ref),
);