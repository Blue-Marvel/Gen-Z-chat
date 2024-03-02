import 'package:gen_z_chat/domain/entity/user_model.dart';

abstract class AuthRepository {
  Future<void> register(String fullName, String email, String password);
  Future<Map<String, dynamic>> login(String email, String password);
  Future<void> sendEmailCode(String token);
  Future<void> verifyEmail(String token, {required String passcode});
  Future<void> logout();
}
