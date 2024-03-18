import 'package:flutter/material.dart';
import 'package:obamahome/app/models/lesson_plan_models.dart';

class ListLessonPlan extends StatefulWidget {
  const ListLessonPlan({super.key});

  @override
  _ListLessonPlanState createState() => _ListLessonPlanState();
}

class _ListLessonPlanState extends State<ListLessonPlan> {
  final List<LessonPlan> _lessonPlans = List.generate(
    100,
    (index) {
      return LessonPlan(
        titulo:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        autor: index % 2 == 0 ? ' J. R. R. Tolkien' : 'C. S. Lewis',
        dataPublicacao: DateTime.now(),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _lessonPlans.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildHeader();
                } else {
                  final lessonPlan = _lessonPlans[index - 1];
                  return _buildRow(
                    lessonPlan.titulo,
                    lessonPlan.autor,
                    lessonPlan.dataPublicacao.toString(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Material(
      child: Container(
        color: Colors.blueGrey[50],
        padding: const EdgeInsets.all(8.0),
        child: const Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.0,
                ),
                child: Text(
                  'Título',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Autor',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Data de Publicação',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String author, String date) {
    return Material(
      child: InkWell(
        hoverColor: const Color(0x00000001),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Colors.black87,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(title),
                ),
                Expanded(
                  flex: 1,
                  child: Text(author),
                ),
                Expanded(
                  flex: 1,
                  child: Text(date),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
