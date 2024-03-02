import 'dart:convert';

import 'package:gen_z_chat/data/remote_data_source/api_routes.dart';
import 'package:gen_z_chat/domain/entity/user_model.dart';
import 'package:http/http.dart' as http;

final class AuthRemoteSource {
  final http.Client httpClient;

  AuthRemoteSource(this.httpClient);

  Future<void> register(String fullName, String email, String password) async {
    final url = Uri.parse(ApiRoute.register);
    final registerMap = {
      "name": fullName,
      "email": email,
      "password": password,
    };

    try {
      final http.Response response =
          await httpClient.post(url, body: json.encode(registerMap));
      // final responseBody = json.decode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return;
      }
      throw Exception("Fail to register");
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse(ApiRoute.login);
    final loginMap = {
      "email": email,
      "password": password,
    };
    try {
      final http.Response response =
          await httpClient.post(url, body: json.encode(loginMap));
      final responseBody = json.decode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return {
          "user": User.fromJson(responseBody['user']),
          "token": responseBody['token'],
        };
      }
      throw Exception("Fail to login");
    } catch (e) {
      // throw Exception(e.toString());
      rethrow;
    }
  }

  Future<void> sendEmailCode(String token) async {
    final url = Uri.parse(ApiRoute.sendEmailCode);
    final sendEmailMap = {"token": token};
    try {
      // final http.Response response =
      await httpClient.post(url, headers: sendEmailMap);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> verifyEmail(String token, {required String passcode}) async {
    final url = Uri.parse(ApiRoute.verifyEmailCode);
    final verifyEmailMap = {"passcode": passcode};
    try {
      await httpClient.post(url,
          body: json.encode(verifyEmailMap), headers: {"passcode": passcode});
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> logout() async {
    final url = Uri.parse(ApiRoute.logout);
    try {
      // final http.Response response =
      await httpClient.get(url);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
