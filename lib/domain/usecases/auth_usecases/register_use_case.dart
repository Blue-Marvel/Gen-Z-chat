import 'package:gen_z_chat/domain/repository/auth_repository.dart';

final class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  Future<void> call(String fullName, String email, String password) async {
    await authRepository.register(fullName, email, password);
  }
}
