import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/app/controllers/lessons_controller.dart';
import 'package:obamahome/app/models/lesson_plan_models.dart';
import 'package:obamahome/components/bannerSuperior.dart';
import 'package:obamahome/templates/template_basic_col.dart';
import 'package:obamahome/utils/app_padding.dart';

class ListLessonPlan extends ConsumerStatefulWidget {
  const ListLessonPlan({super.key});

  @override
  _ListLessonPlanState createState() => _ListLessonPlanState();
}

class _ListLessonPlanState extends ConsumerState<ListLessonPlan> {
  String searchTerm = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: randomName(searchTerm, ref),
        builder: (context, snapshot) {
          final lessonsData = ref.watch(lessons);
          List<LessonPlan> data = [...lessonsData];
          return TemplateColumn(
            children: [
              BannerSuperior(context, "Planos de Aula"),
              Container(
                  margin: paddingValues("carouselTop", context),
                  padding: paddingValues("sideMainPadding", context),
                  child: Column(children: [
                    TextField(
                      onSubmitted: (value) {},
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return _buildHeader();
                        } else {
                          final lessonPlan = data[index - 1];
                          return _buildRow(
                            lessonPlan.titulo,
                            lessonPlan.autor,
                            lessonPlan.dataPublicacao.toString(),
                          );
                        }
                      },
                    ),
                  ])),
            ],
          );
        });
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
