import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_z_chat/data/remote_data_source/auth_api.dart';
import 'package:gen_z_chat/data/repository_impl/auth_repo_impl.dart';
import 'package:gen_z_chat/domain/usecases/auth_usecases/login_usecase.dart';
import 'package:gen_z_chat/domain/usecases/auth_usecases/register_use_case.dart';
import 'package:gen_z_chat/domain/usecases/auth_usecases/send_email_code_usecase.dart';
import 'package:gen_z_chat/domain/usecases/auth_usecases/verify_email_usecases.dart';
import 'package:http/http.dart' as http;

final authUseCaseProvider = Provider<AuthUseCases>((ref) {
  final remoteCaller = AuthRemoteSource(http.Client());
  final authRepositoryImpl = AuthRepoImpl(remoteCaller);
  return AuthUseCases(
    registerUseCase: RegisterUseCase(authRepositoryImpl),
    loginUseCase: LoginUseCase(authRepositoryImpl),
    sendEmailCodeUseCase: SendEmailCodeUseCase(authRepositoryImpl),
    verifyEmailUseCase: VerifyEmailUseCase(authRepositoryImpl),
  );
});

final class AuthUseCases {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final SendEmailCodeUseCase sendEmailCodeUseCase;
  final VerifyEmailUseCase verifyEmailUseCase;
  AuthUseCases({
    required this.registerUseCase,
    required this.loginUseCase,
    required this.sendEmailCodeUseCase,
    required this.verifyEmailUseCase,
  });
}
