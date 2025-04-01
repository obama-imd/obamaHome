import 'dart:convert';
import 'dart:io';

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
  List<TemaConteudo> responseDescritor = [];

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

  // apiUrl = '${API_URL}/temaconteudo?curriculo=';
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

  apiUrl = '${API_URL}/descritor';
  response = await http.get(Uri.parse(apiUrl),
      headers: {HttpHeaders.accessControlAllowOriginHeader: API_URL});

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    // responseDescritor.addAll(List<TemaConteudo>.from(
    //     jsonData.map((x) => TemaConteudo.fromJson(x))));
  } else {
    return Future.error(
        'Failed to load ${TemaConteudo}. Status code: ${response.statusCode}');
  }

  final tudo = SearchParametersResult(
      allNivelEnsino: responseNivelEnsino,
      allTemaConteudo: responseTemaConteudo);
  return tudo;
}

Future<List<Habilidade>> fetchHabilidadeByAnoEnsinoTemaConteudo(int? idAnoEnsino, int? idConteudo) async {
  List<Habilidade> responseHabilidade;

  var apiUrl =
      '${API_URL}/habilidade?anoEnsino=$idAnoEnsino&temaConteudoId=$idConteudo';
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
        'Failed to load ${TemaConteudo}. Status code: ${response.statusCode}');
  }

  return responseHabilidade;
}

