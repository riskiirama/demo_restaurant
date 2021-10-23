import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/models/user_model.dart';

class AuthService {
  String baseUrl = 'https://byenspizza8751.dk/panel/public/api';

  Future<UserModel> register({
    String name,
    String email,
    String password,
  }) async {
    var url = '$baseUrl/regUser';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String email,
    String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      return data;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
