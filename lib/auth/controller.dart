import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../utils/apiURL.dart';

final storage = FlutterSecureStorage();

var hasUserSession = true;

Future<String?> userToken() async {
  return await storage.read(key: 'access_token');
}

Future<void> removeUserToken() async {
  hasUserSession = false;
  return await storage.delete(key: 'access_token');
}

Future<bool> userLoggedIn() async {
  var result = false;
  userToken().then((x) {
    result = x?.isNotEmpty ?? false;
  });
  return result;
}

// obama.imd.ufrn/api/v1/auth/login
Future<bool> fetchLogin(String email, String password) async {
  var apiUrl = '${API_URL}auth/login';

  try {
    final response = await http.post(
      Uri.parse(apiUrl), // Substitua pelo seu endpoint
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'login': email, 'senha': password}),
    );

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // Login bem-sucedido
      await storage.write(
          key: 'access_token', value: responseData['access_token']);
      await storage.write(
          key: 'refresh_token', value: responseData['refresh_token']);
      hasUserSession = true;
      return hasUserSession;
      // Navegar para a próxima tela ou salvar dados
    } else {
      removeUserToken();
      print(responseData['message'] ?? 'Erro desconhecido');
      return false;
    }
  } catch (e) {
    removeUserToken();
    print('Erro de conexão');
    return false;
  } finally {
    print('Concluído');
  }
}
