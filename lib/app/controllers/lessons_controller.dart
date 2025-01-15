import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/lesson_plan_models.dart';

List<LessonPlan> _lessonPlans = List.generate(
  100,
  (index) {
    return LessonPlan(
        id: DateTime.now().millisecond,
        title:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. $index",
        status: 'CREATED');
  },
);

final lessons = StateProvider<List<LessonPlan>>((ref) {
  return [];
});

// List<dynamic> filtrarLessons(List<dynamic> jsonData, String searchTerm) {
List<LessonPlan> filtrarLessons(List<LessonPlan> jsonData, String searchTerm) {
  // if (searchTerm.isEmpty) {
  //   return jsonData;
  // }

  List<LessonPlan> comparingData = jsonData.where((item) {
    final title = item.title.toString().toLowerCase();

    return title.contains(searchTerm.toLowerCase());
  }).toList();

  if (comparingData.isEmpty) {
    return <LessonPlan>[];
  } else {
    return comparingData;
  }
}

Future<LessonPlan>? randomName(String searchTerm, WidgetRef ref) {
  final List<LessonPlan> lessonResults =
      filtrarLessons(_lessonPlans, searchTerm);
  final newLessons = ref.read(lessons);
  newLessons.clear();
  newLessons.addAll(lessonResults as Iterable<LessonPlan>);
  return null;
}
