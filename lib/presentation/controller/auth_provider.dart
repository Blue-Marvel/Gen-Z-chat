import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_z_chat/domain/entity/user_model.dart';
import 'package:gen_z_chat/domain/usecases/auth_usecases/auth_usecases.dart';

final authProvider = Provider<AuthProvider>((ref) {
  final authUseCases = ref.read(authUseCaseProvider);
  return AuthProvider(authUseCases: authUseCases);
});

class AuthProvider extends ChangeNotifier {
  final AuthUseCases authUseCases;
  AuthProvider({required this.authUseCases});
  User? _user;
  String? _token;

  User? get user => _user;
  String? get token => _token;

  Future<void> registerUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      await authUseCases.registerUseCase.call(fullName, email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      final Map<String, dynamic> loginData =
          await authUseCases.loginUseCase.call(email, password);
      final token = loginData["token"];
      _token = token;
      _user = loginData["user"];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendEmailCode() async {
    await authUseCases.sendEmailCodeUseCase.call(token: _token!);
  }

  Future<void> verifyEmail({required String passcode}) async {
    await authUseCases.verifyEmailUseCase
        .call(token: _token!, passcode: passcode);
  }
}
