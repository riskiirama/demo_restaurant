import 'dart:convert';

import 'package:restaurant_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = "https://byenspizza8751.dk/panel/public/api";

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

    var respone = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(respone.body);

    if (respone.statusCode == 200) {
      var data = jsonDecode(respone.body)['user'];
      UserModel userModel = UserModel.fromJson(data);
      userModel.token = ('access_token');

      return userModel;
    } else {
      throw Exception('Invalid Register');
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

    var respone = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(respone.body);

    if (respone.statusCode == 200) {
      var data = jsonDecode(respone.body)['user'];
      UserModel userModel = UserModel.fromJson(data);
      userModel.token = ('access_token');

      return userModel;
    } else {
      throw Exception('Invalid Login');
    }
  }
}
