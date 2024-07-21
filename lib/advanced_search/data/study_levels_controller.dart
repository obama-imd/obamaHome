import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/advanced_search/application/study_level_service.dart';
import 'package:obamahome/advanced_search/domain/study_level.dart';

class StudyLevelListController
    extends StateNotifier<AsyncValue<List<StudyLevelModel>>> {
  StudyLevelListController({
    required this.studylevelService,
  }) : super(const AsyncData<List<StudyLevelModel>>([]));

  final StudyLevelService studylevelService;

  Future<void> loadLevels() async {
    state = AsyncLoading<List<StudyLevelModel>>();
    state = await AsyncValue.guard(() async {
      return studylevelService.fetchAll();
    });
  }
}

final allStudyLevelProvider = StateNotifierProvider<StudyLevelListController,
    AsyncValue<List<StudyLevelModel>>>(
  (ref) {
    return StudyLevelListController(
      studylevelService: ref.watch(studyLevelService),
    );
  },
);
