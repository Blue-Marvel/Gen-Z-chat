import 'package:gen_z_chat/data/remote_data_source/auth_api.dart';
import 'package:gen_z_chat/domain/repository/auth_repository.dart';

final class AuthRepoImpl implements AuthRepository {
  final AuthRemoteSource authRemoteSource;

  AuthRepoImpl(this.authRemoteSource);

  @override
  Future<void> register(String fullName, String email, String password) {
    return authRemoteSource.register(fullName, email, password);
  }

  @override
  Future<Map<String, dynamic>> login(String email, String password) {
    return authRemoteSource.login(email, password);
  }

  @override
  Future<void> sendEmailCode(String token) {
    return authRemoteSource.sendEmailCode(token);
  }

  @override
  Future<void> verifyEmail(String token, {required String passcode}) {
    return authRemoteSource.verifyEmail(token, passcode: passcode);
  }

  @override
  Future<void> logout() {
    return authRemoteSource.logout();
  }
}


//Chalieonafriday
//after hours