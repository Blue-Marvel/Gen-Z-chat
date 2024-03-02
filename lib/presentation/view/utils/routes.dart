import 'package:gen_z_chat/presentation/view/screens/auth_screens/login_screen.dart';
import 'package:gen_z_chat/presentation/view/screens/auth_screens/send_verification_code_screen.dart';
import 'package:gen_z_chat/presentation/view/screens/auth_screens/signup_screen.dart';
import 'package:gen_z_chat/presentation/view/screens/auth_screens/verify_email_screen.dart';
import 'package:gen_z_chat/presentation/view/screens/home.dart';
import 'package:gen_z_chat/presentation/view/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter route = GoRouter(
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: SignupScreen.routeName,
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: HomeMenu.routeName,
      builder: (context, state) => const HomeMenu(),
    ),
    GoRoute(
      path: SendEmailCodeScreen.routeName,
      builder: (context, state) => const SendEmailCodeScreen(),
    ),
    GoRoute(
      path: VerifyEmailScreen.routeName,
      builder: (context, state) => const VerifyEmailScreen(),
    )
  ],
);
