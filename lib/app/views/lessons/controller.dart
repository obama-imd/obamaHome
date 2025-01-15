import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:obamahome/app/models/lesson_plan_models.dart';
import 'package:obamahome/auth/controller.dart';
import 'package:obamahome/utils/apiURL.dart';
import 'dart:io';

Future<List<LessonPlan>?> fetchLessonPlan() async {
  var apiUrl = '${API_URL}planoaula?page=0&limit=100&sort=titulo&titulo=';
  List<LessonPlan> lessonPlanResponse = [];
  try {
    final String token = await userToken() ?? '';

    final headers = {
      'Content-Type': 'application/json',
      HttpHeaders.accessControlAllowOriginHeader: API_URL,
      'Authorization': 'Bearer $token',
      'accept': 'application/json'
    };
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: headers,
    );

    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      lessonPlanResponse = List<LessonPlan>.from(
          jsonData['content'].map((x) => LessonPlan.fromJson(x)));
    } else {
      print(jsonData['message'] ?? 'Erro desconhecido');
    }
    return lessonPlanResponse;
  } catch (e) {
    print('Erro de conexão');
    throw Exception('$e');
  } finally {
    print('Concluído');
  }
}

Future<LessonPlan?> saveNewLessonPlan(LessonPlanModel model) async {
  var apiUrl = '${API_URL}planoaula/salvar';
  var lessonPlanResponse;
  try {
    final String token = await userToken() ?? '';

    final headers = {
      'Content-Type': 'application/json',
      HttpHeaders.accessControlAllowOriginHeader: API_URL,
      'Authorization': 'Bearer $token',
      'accept': 'application/json'
    };
    final body = jsonEncode(model.toJson());

    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      lessonPlanResponse = LessonPlan.fromJson(jsonData);
    } else {
      print(jsonData['message'] ?? 'Erro desconhecido');
      throw Exception(jsonData['error']);
    }
    return lessonPlanResponse;
  } catch (e) {
    print('Erro de conexão');
    throw Exception('$e');
  } finally {
    print('Concluído');
  }
}
