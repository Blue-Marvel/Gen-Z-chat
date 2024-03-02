import 'package:gen_z_chat/domain/repository/auth_repository.dart';

final class SendEmailCodeUseCase {
  final AuthRepository authRepository;

  SendEmailCodeUseCase(this.authRepository);

  Future<void> call({required String token}) {
    return authRepository.sendEmailCode(token);
  }
}
