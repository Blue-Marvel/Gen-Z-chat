import 'package:gen_z_chat/domain/entity/user_model.dart';
import 'package:gen_z_chat/domain/repository/auth_repository.dart';

final class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<Map<String, dynamic>> call(String email, String password) async {
    return await authRepository.login(email, password);
  }
}
