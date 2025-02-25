import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:obamahome/app/models/objeto_aprendizagem.dart';

import '../../utils/apiURL.dart';
import '../models/pagination_oa_model.dart';

Future<PaginationResponse?> fetchData(
    String searchTerm, int page, String? queryParams) async {
  var apiUrl =
      '${API_URL}/oa?page=${page}&size=12&sort=nome${searchTerm.isNotEmpty ? '&nome=$searchTerm' : ''}';
  if (queryParams != null && queryParams.isNotEmpty) {
    apiUrl = '${API_URL}/oa?$queryParams&page=${page}&size=12';
  }

  final response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    PaginationResponse paginationResponse =
        PaginationResponse.fromJson(Map.from(jsonData));

    return paginationResponse;
  } else {
    print(
        'Failed to load ${PaginationResponse}. Status code: ${response.statusCode}');
    return null;
  }
}

Future<ObjetoAprendizagem> fetchOAById(int id) async {
  var apiUrl = '${API_URL}/oa/${id}';

  final response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    ObjetoAprendizagem objetoAprendizagemResponse =
        ObjetoAprendizagem.fromJson(Map.from(jsonData));
    return objetoAprendizagemResponse;
  } else {
    return Future.error(
        'Failed to load data. Status code: ${response.statusCode}');
  }
}

class SearchParametersResult {
  final List<NivelEnsino> allNivelEnsino;
  final List<TemaConteudo> allTemaConteudo;

  SearchParametersResult(
      {required this.allNivelEnsino, required this.allTemaConteudo});
}

Future<SearchParametersResult> fetchSearchData() async {
  List<NivelEnsino> responseNivelEnsino = [];
  List<TemaConteudo> responseTemaConteudo = [];

  var apiUrl = '${API_URL}/nivelensino';
  var response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    responseNivelEnsino =
        List<NivelEnsino>.from(jsonData.map((x) => NivelEnsino.fromJson(x)));
  } else {
    return Future.error(
        'Failed to load ${TemaConteudo}. Status code: ${response.statusCode}');
  }

  apiUrl = '${API_URL}/temaconteudo?curriculo=BNCC';
  response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    responseTemaConteudo = List<TemaConteudo>.from(
        jsonData.map((x) => TemaConteudo.fromJson(x, 'BNCC')));
  } else {
    return Future.error(
        'Failed to load ${TemaConteudo}. Status code: ${response.statusCode}');
  }

  apiUrl = '${API_URL}/temaconteudo?curriculo=PCN';
  response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    responseTemaConteudo.addAll(List<TemaConteudo>.from(
        jsonData.map((x) => TemaConteudo.fromJson(x, 'PCN'))));
  } else {
    return Future.error(
        'Failed to load ${TemaConteudo}. Status code: ${response.statusCode}');
  }

  final tudo = SearchParametersResult(
      allNivelEnsino: responseNivelEnsino,
      allTemaConteudo: responseTemaConteudo);
  return tudo;
}

Future<List<Habilidade>> fetchHabilidadeByAnoEnsinoTemaConteudo(
    String? idConteudo, String? idAnoEnsino) async {
  List<Habilidade> responseHabilidade;

  var apiUrl =
      '${API_URL}/habilidade?anoEnsino=$idAnoEnsino&temaConteudoId=$idConteudo';
  var response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    responseHabilidade =
        List<Habilidade>.from(jsonData.map((x) => Habilidade.fromJson(x)));
  } else {
    return Future.error(
        'Failed to load ${TemaConteudo}. Status code: ${response.statusCode}');
  }

  return responseHabilidade;
}

Future<List<NivelEnsino>> fetchNivelEnsino() async {
  var apiUrl = '${API_URL}/nivelensino';

  var response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    return List<NivelEnsino>.from(jsonData.map((x) => NivelEnsino.fromJson(x)));
  } else {
    return Future.error(
        'Failed to load ${NivelEnsino}. Status code: ${response.statusCode}');
  }
}

final searchPagination = StateProvider<PaginationResponse?>((ref) {
  return null;
});

final oaData = StateProvider<ObjetoAprendizagem?>((ref) {
  return null;
});

class StudyLevelsNotifier extends StateNotifier<List<NivelEnsino>> {
  StudyLevelsNotifier() : super([]);

  void setLevels(List<NivelEnsino> newLevels) {
    state = newLevels;
  }

  void addLevel(NivelEnsino level) {
    if (!state.contains(level)) {
      state = [...state, level];
    }
  }

  void clearLevels() {
    state = [];
  }
}

class StudyClassesNotifier extends StateNotifier<List<AnoEnsino?>> {
  StudyClassesNotifier() : super([]);

  void setClasses(List<AnoEnsino?> newClasses) {
    state = newClasses;
  }

  void addClass(AnoEnsino className) {
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

class AbilityNotifier extends StateNotifier<List<Habilidade>> {
  AbilityNotifier() : super([]);

  void setAbilities(List<Habilidade> newAbilities) {
    state = newAbilities;
  }

  void addAbility(Habilidade ability) {
    if (!state.contains(ability)) {
      state = [...state, ability];
    }
  }

  void clearAbilities() {
    state = [];
  }
}

final studyLevelsProvider =
    StateNotifierProvider<StudyLevelsNotifier, List<NivelEnsino?>>((ref) {
  return StudyLevelsNotifier();
});

final studyClassesProvider =
    StateNotifierProvider<StudyClassesNotifier, List<AnoEnsino?>>((ref) {
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
    StateNotifierProvider<AbilityNotifier, List<Habilidade?>>((ref) {
  return AbilityNotifier();
});

Future<void> fetchLevels(WidgetRef ref) async {
  int page = 0;

  try {
    final responseNivelEnsino = await http.get(
        Uri.parse('${API_URL}/nivelensino'),
        headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

    final responseAnoEnsinoResource = await http.get(
        Uri.parse('${API_URL}/anoEnsino?page=$page&size=50&sort=id'),
        headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

    final responseDescritor = await http.get(
        Uri.parse('${API_URL}/descritor?page=$page&size=50&sort=id'),
        headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

    final responseDisciplineResource = await http.get(
        Uri.parse('${API_URL}/disciplina?page=$page&size=50&sort=id'),
        headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

    if (responseNivelEnsino.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(responseNivelEnsino.bodyBytes));
      List<NivelEnsino> setLevels = List<NivelEnsino>.from(jsonData.map((data) {
        return NivelEnsino.fromJson(data);
      }));

      ref.read(studyLevelsProvider.notifier).setLevels(setLevels);
    } else {
      throw Exception(
          'Failed to fetch API data. Status code: ${responseNivelEnsino.statusCode}');
    }

    if (responseAnoEnsinoResource.statusCode == 200) {
      final jsonData =
          jsonDecode(utf8.decode(responseAnoEnsinoResource.bodyBytes));

      List<AnoEnsino> setClasses = List<AnoEnsino>.from(jsonData.map((data) {
        return AnoEnsino.fromJson(data);
      }));

      ref.read(studyClassesProvider.notifier).setClasses(setClasses);
    } else {
      throw Exception(
          'Failed to fetch API data. Status code: ${responseAnoEnsinoResource.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    throw Exception('Failed to fetch API data.');
  }
}
