import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:obamahome/app/models/objeto_aprendizagem.dart';

import '../../utils/apiURL.dart';
import '../models/pagination_oa_model.dart';

Future<PaginationResponse?> fetchData(
    String searchTerm, int page, String? queryParams) async {
  var apiUrl =
      '${API_URL}oa?page=${page}&size=12&sort=nome${searchTerm.isNotEmpty ? '&nome=$searchTerm' : ''}';
  if (queryParams != null && queryParams.isNotEmpty) {
    apiUrl = '${API_URL}oa?$queryParams&page=${page}&size=12&sort=nome';
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
  var apiUrl = '${API_URL}oa/$id';

  try {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL},
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

      final objetoAprendizagemResponse =
          ObjetoAprendizagem.fromJson(Map<String, dynamic>.from(jsonData));

      return objetoAprendizagemResponse;
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e, stackTrace) {
    print('Erro ao processar ObjetoAprendizagem: $e');
    print(stackTrace);
    rethrow;
  }
}

class SearchParametersResult {
  final List<NivelEnsino> allNivelEnsino;
  final List<TemaConteudo> allTemaConteudo;
  final List<Descritor> allDescricoes;

  SearchParametersResult(
      {required this.allNivelEnsino,
      required this.allTemaConteudo,
      required this.allDescricoes});
}

Future<SearchParametersResult> fetchSearchData(String? curriculo) async {
  List<NivelEnsino> responseNivelEnsino = [];
  List<TemaConteudo> responseTemaConteudo = [];
  List<Descritor> responseDescritor = [];

  var apiUrl = '${API_URL}nivelensino';
  var response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    responseNivelEnsino =
        List<NivelEnsino>.from(jsonData.map((x) => NivelEnsino.fromJson(x)));
  } else {
    return Future.error(
        'Failed to load ${NivelEnsino}. Status code: ${response.statusCode}');
  }

  apiUrl = '${API_URL}temaconteudo?curriculo=${curriculo}';
  response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    responseTemaConteudo = List<TemaConteudo>.from(
        jsonData.map((x) => TemaConteudo.fromJson(x, curriculo ?? '')));
  } else {
    return Future.error(
        'Failed to load ${TemaConteudo}. Status code: ${response.statusCode}');
  }

  apiUrl = '${API_URL}descritor';
  response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    if (jsonData.containsKey('content') && jsonData['content'] is List) {
      responseDescritor = Descritor.fromJsonList(jsonData['content']);
    } else {
      throw Exception('Formato de JSON inválido');
    }
  } else {
    return Future.error(
        'Failed to load ${Descritor}. Status code: ${response.statusCode}');
  }

  final tudo = SearchParametersResult(
    allNivelEnsino: responseNivelEnsino,
    allTemaConteudo: responseTemaConteudo,
    allDescricoes: responseDescritor,
  );

  return tudo;
}

Future<List<AnoEnsino>> fetchAnoEnsino() async {
  List<AnoEnsino> responseAnoEnsino;

  var apiUrl = '${API_URL}anoEnsino';
  var response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    List<AnoEnsino> habilidadesFromJson(List<dynamic> jsonList) {
      return jsonList.map((json) => AnoEnsino.fromJson(json)).toList();
    }

    responseAnoEnsino = habilidadesFromJson(jsonData["content"]);
  } else {
    return Future.error(
        'Failed to load ${AnoEnsino}. Status code: ${response.statusCode}');
  }

  return responseAnoEnsino;
}

Future<List<Habilidade>> fetchHabilidadeByAnoEnsinoTemaConteudo(
    int? IdAnoEnsino, int? idConteudo) async {
  List<Habilidade> responseHabilidade;

  var apiUrl =
      '${API_URL}habilidade?anoEnsinoId=$IdAnoEnsino&temaConteudoId=$idConteudo';
  var response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    List<Habilidade> habilidadesFromJson(List<dynamic> jsonList) {
      return jsonList.map((json) => Habilidade.fromJson(json)).toList();
    }

    responseHabilidade = habilidadesFromJson(jsonData["content"]);
  } else {
    return Future.error(
        'Failed to load ${Habilidade}. Status code: ${response.statusCode}');
  }

  return responseHabilidade;
}
