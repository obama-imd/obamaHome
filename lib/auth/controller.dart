import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../utils/apiURL.dart';

final storage = FlutterSecureStorage();

var hasUserSession = false;

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
      Uri.parse(apiUrl),
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

Future<void> validateUser(String token) async {
  var apiUrl = '${API_URL}usuario/ativar';

  try {
    final response = await http.patch(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'token': token}),
    );

    if (response.statusCode != 204) {
      print(response);
      throw Exception('Ocorreu um erro!');
    }
  } catch (e) {
    print('Erro de conexão');
    throw Exception('Ocorreu um erro de conexão');
  } finally {
    print('Concluído');
  }
}

Future<bool> newUser(String name, String email, String password) async {
  var apiUrl = '${API_URL}usuario/cadastrar';
  bool resultado = false;

  bool isPasswordValid(String password) {
    final hasUppercase = RegExp(r'[A-Z]');
    final hasDigit = RegExp(r'[0-9]');
    final hasSpecialChar = RegExp(r'[!@#\$&*~._-]'); // ajuste conforme desejado

    return hasUppercase.hasMatch(password) &&
        hasDigit.hasMatch(password) &&
        hasSpecialChar.hasMatch(password);
  }

  if (!isPasswordValid(password)) {
    print(
        'Senha inválida: deve conter ao menos uma letra maiúscula, um número e um caractere especial.');
    return false;
  }
  try {
    final Map<String, dynamic> body = {
      "nome": name.split(' ').first,
      "sobrenome": name.split(' ').last,
      "email": email,
      "senha": password,
    };

    final headers = {
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 201) {
      // resultado = await fetchLogin(email, password);
      resultado = true;
    } else {
      print(responseData['message'] ?? 'Erro desconhecido');
      resultado = false;
    }
  } catch (e) {
    print('Erro de conexão');
    resultado = false;
  } finally {
    print('Concluído');
  }
  return resultado;
}
