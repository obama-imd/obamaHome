import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:obamahome/app/models/advancedSearch/study_level.dart';

import '../../utils/apiURL.dart';
import '../models/pagination_oa_model.dart';
import '../models/search_models.dart';

PaginationResponse filtrarOA(PaginationResponse jsonData, String searchTerm) {
  if (searchTerm.isEmpty) {
    return jsonData;
  }

  List<Content> comparingData = jsonData.content.where((item) {
    var nome = item!.nome!.toLowerCase();

    return nome.contains(searchTerm.toLowerCase());
  }).toList();

  jsonData.content = comparingData;

  if (comparingData.isEmpty) {
    return jsonData;
  } else {
    return jsonData;
  }
}

Future<void> fetchData(String searchTerm, ref, page) async {
  var apiUrl = '${API_URL}/oa?page=${page}&size=12&sort=id';

  final response = await http.get(Uri.parse(apiUrl), headers: {
    HttpHeaders.accessControlAllowOriginHeader: 'http://hobama.imd.ufrn.br/'
  });

  if (response.statusCode == 200) {
    // final jsonData = filtrarOA(jsonDecode(response.body), searchTerm);
    final jsonData = jsonDecode(response.body);

    PaginationResponse paginationResponse =
        PaginationResponse.fromJson(jsonData as Map<String, dynamic>);

    ref.read(searchPagination.notifier).state = paginationResponse;
  } else {
    print('Failed to load data. Status code: ${response.statusCode}');
    ref.read(searchPagination.notifier).state = null;
  }
}

final searchPagination = StateProvider<PaginationResponse?>((ref) {
  return null;
});

class StudyLevelsNotifier extends StateNotifier<List<String?>> {
  StudyLevelsNotifier() : super([]);

  void setLevels(List<String?> newLevels) {
    state = newLevels;
  }

  void addLevel(String level) {
    if (!state.contains(level)) {
      state = [...state, level];
    }
  }

  void clearLevels() {
    state = [];
  }
}

class StudyClassesNotifier extends StateNotifier<List<String?>> {
  StudyClassesNotifier() : super([]);

  void setClasses(List<String?> newClasses) {
    state = newClasses;
  }

  void addClass(String className) {
    if (!state.contains(className)) {
      state = [...state, className];
    }
  }

  void clearClasses() {
    state = [];
  }
}

class DescriberNotifier extends StateNotifier<List<String?>> {
  DescriberNotifier() : super([]);

  void setDescribers(List<String?> newDescribers) {
    state = newDescribers;
  }

  void addDescriber(String describer) {
    if (!state.contains(describer)) {
      state = [...state, describer];
    }
  }

  void clearDescribers() {
    state = [];
  }
}

class DisciplineNotifier extends StateNotifier<List<String?>> {
  DisciplineNotifier() : super([]);

  void setDisciplines(List<String?> newDisciplines) {
    state = newDisciplines;
  }

  void addDiscipline(String discipline) {
    if (!state.contains(discipline)) {
      state = [...state, discipline];
    }
  }

  void clearDisciplines() {
    state = [];
  }
}

class AbilityNotifier extends StateNotifier<List<String>> {
  AbilityNotifier() : super([]);

  void setAbilities(List<String> newAbilities) {
    state = newAbilities;
  }

  void addAbility(String ability) {
    if (!state.contains(ability)) {
      state = [...state, ability];
    }
  }

  void clearAbilities() {
    state = [];
  }
}

final studyLevelsProvider =
    StateNotifierProvider<StudyLevelsNotifier, List<String?>>((ref) {
  return StudyLevelsNotifier();
});

final studyClassesProvider =
    StateNotifierProvider<StudyClassesNotifier, List<String?>>((ref) {
  return StudyClassesNotifier();
});

final describerProvider =
    StateNotifierProvider<DescriberNotifier, List<String?>>((ref) {
  return DescriberNotifier();
});

final disciplineProvider =
    StateNotifierProvider<DisciplineNotifier, List<String?>>((ref) {
  return DisciplineNotifier();
});

final abilityProvider =
    StateNotifierProvider<AbilityNotifier, List<String?>>((ref) {
  return AbilityNotifier();
});

Future<void> fetchLevels(WidgetRef ref) async {
  int page = 0;

  try {
    final responseNivelEnsino = await http
        .get(Uri.parse('${API_URL}/nivelensino'), headers: {
      HttpHeaders.accessControlAllowOriginHeader: 'http://hobama.imd.ufrn.br/'
    });

    final responseAnoEnsinoResource = await http.get(
        Uri.parse('${API_URL}/anoEnsino?page=$page&size=50&sort=id'),
        headers: {
          HttpHeaders.accessControlAllowOriginHeader:
              'http://hobama.imd.ufrn.br/'
        });

    final responseDescritor = await http.get(
        Uri.parse('${API_URL}/descritor?page=$page&size=50&sort=id'),
        headers: {
          HttpHeaders.accessControlAllowOriginHeader:
              'http://hobama.imd.ufrn.br/'
        });

    final responseDisciplineResource = await http.get(
        Uri.parse('${API_URL}/disciplina?page=$page&size=50&sort=id'),
        headers: {
          HttpHeaders.accessControlAllowOriginHeader:
              'http://hobama.imd.ufrn.br/'
        });

    // final responseHabilidadeResource = await http.get(
    //     Uri.parse(
    //         '${API_URL}/habilidade?anoEnsinoId=1&temaConteudoId=1&page=$page&size=12&sort=id'),
    //     headers: {
    //       HttpHeaders.accessControlAllowOriginHeader:
    //           'http://hobama.imd.ufrn.br/'
    //     });

    // final responseTemaConteudo = await http.get(Uri.parse('${API_URL}/temaConteudo?curriculo=1'), headers: {
    //   HttpHeaders.accessControlAllowOriginHeader: 'http://hobama.imd.ufrn.br/'
    // });

    if (responseNivelEnsino.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(responseNivelEnsino.body);
      List<String?> setLevels =
          jsonData.map((level) => level["nome"] as String?).toList();

      ref.read(studyLevelsProvider.notifier).setLevels(setLevels);
    } else {
      throw Exception(
          'Failed to fetch API data. Status code: ${responseNivelEnsino.statusCode}');
    }

    if (responseAnoEnsinoResource.statusCode == 200) {
      var jsonData = jsonDecode(responseAnoEnsinoResource.body);

      PaginationResponse paginationResponse =
          PaginationResponse.fromJson(jsonData as Map<String, dynamic>);

      List<String?> setClasses =
          paginationResponse.content.map((level) => level.nome).toList();

      ref.read(studyClassesProvider.notifier).setClasses(setClasses);
    } else {
      throw Exception(
          'Failed to fetch API data. Status code: ${responseAnoEnsinoResource.statusCode}');
    }

    // if (responseDescritor.statusCode == 200) {
    //   var jsonData = jsonDecode(responseDescritor.body);

    //   PaginationResponse paginationResponse =
    //       PaginationResponse.fromJson(jsonData as Map<String, dynamic>);

    //   List<String?> setDescribers =
    //       paginationResponse.content.map((level) => level.descricao).toList();

    //   ref.read(describerProvider.notifier).setDescribers(setDescribers);
    // } else {
    //   throw Exception(
    //       'Failed to fetch API data. Status code: ${responseDescritor.statusCode}');
    // }

    if (responseDisciplineResource.statusCode == 200) {
      var jsonData = jsonDecode(responseDisciplineResource.body);

      PaginationResponse paginationResponse =
          PaginationResponse.fromJson(jsonData as Map<String, dynamic>);

      List<String?> setDisciplines =
          paginationResponse.content.map((level) => level.nome).toList();

      ref.read(disciplineProvider.notifier).setDisciplines(setDisciplines);
    } else {
      throw Exception(
          'Failed to fetch API data. Status code: ${responseDisciplineResource.statusCode}');
    }

    // if (responseHabilidadeResource.statusCode == 200) {
    //   List<dynamic> jsonData = jsonDecode(responseHabilidadeResource.body);
    //   List<String> setAbilities =
    //       jsonData.map((level) => level["descricao"] as String).toList();

    //   ref.read(abilityProvider.notifier).setAbilities(setAbilities);
    // } else {
    //   throw Exception(
    //       'Failed to fetch API data. Status code: ${responseHabilidadeResource.statusCode}');
    // }

    // if (responseTemaConteudo.statusCode == 200) {
    //   List<dynamic> jsonData = jsonDecode(responseTemaConteudo.body);
    //   List<String> setTheme =
    //       jsonData.map((level) => level["descricao"] as String).toList();

    //   // ref.read(studyLevelsProvider.notifier).setLevels(setTheme);
    // } else {
    //   throw Exception(
    //       'Failed to fetch API data. Status code: ${responseTemaConteudo.statusCode}');
    // }
  } catch (e) {
    print('Error fetching data: $e');
    throw Exception('Failed to fetch API data.');
  }
}


// Future<List<StudyLevelModel>> fetchLevels() async {
//   final response =
//       await http.get(Uri.parse(apiUrl));

//   if (response.statusCode == 200) {
//     final jsonData = jsonDecode(response.body);
//     final posts = jsonData
//         .map<StudyLevelModel>((item) => StudyLevelModel(
//               id: item['id'],
//               nome: item['nome'],
//             ))
//         .toList() as List<StudyLevelModel>;

//     print("nivel => $posts");

//     return posts;
//   } else {
//     return [];
//   }
// }
