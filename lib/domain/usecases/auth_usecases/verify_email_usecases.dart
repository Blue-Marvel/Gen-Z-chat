import 'package:gen_z_chat/domain/repository/auth_repository.dart';

final class VerifyEmailUseCase {
  final AuthRepository authRepository;
  VerifyEmailUseCase(this.authRepository);

  Future<void> call({required String token, required String passcode}) {
    return authRepository.verifyEmail(token, passcode: passcode);
  }
}
