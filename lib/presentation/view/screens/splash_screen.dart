import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_z_chat/presentation/view/screens/auth_screens/signup_screen.dart';
import 'package:gen_z_chat/presentation/view/utils/routes.dart';
import 'package:gen_z_chat/presentation/view/utils/utils.dart';
import 'package:gen_z_chat/presentation/view/utils/colors.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .whenComplete(() => context.go(SignupScreen.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'GEN Z',
          style: TextStyle(
            color: AppColor.textColor,
            fontSize: 40.sp,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
