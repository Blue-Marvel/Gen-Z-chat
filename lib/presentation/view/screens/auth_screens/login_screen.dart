import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gen_z_chat/presentation/controller/auth_provider.dart';
import 'package:gen_z_chat/presentation/view/screens/auth_screens/send_verification_code_screen.dart';
import 'package:gen_z_chat/presentation/view/screens/auth_screens/signup_screen.dart';
import 'package:gen_z_chat/presentation/view/screens/home.dart';
import 'package:gen_z_chat/presentation/view/utils/colors.dart';
import 'package:gen_z_chat/presentation/view/utils/utils.dart';
import 'package:gen_z_chat/presentation/view/widgets/app_button.dart';
import 'package:gen_z_chat/presentation/view/widgets/app_input_field.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void logIn() async {
    final formValidate = _formKey.currentState?.validate();
    if (!formValidate!) return;
    _formKey.currentState?.save();

    setState(() {
      isLoading = true;
    });

    try {
      await ref.read(authProvider).loginUser(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
      // ignore: use_build_context_synchronously
      context.go(SendEmailCodeScreen.routeName);
    } catch (e) {
      print(e);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            height: ScreenUtil().screenHeight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Gen Z',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 30.sp,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Text(
                      'Hey there! Ready to jump back in? Just toss in your details to keep the ball rolling!🚀 ',
                      textAlign: TextAlign.center,
                    ),
                    Gap(30.h),
                    AppInputField(
                      hintText: 'Email...',
                      isEmail: true,
                      editingController: emailController,
                    ),
                    Gap(10.h),
                    AppInputField(
                      hintText: 'Password...',
                      editingController: passwordController,
                    ),
                    Gap(20.h),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Don\'t have an account? ',
                              style: Theme.of(context).textTheme.bodyMedium),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => context.push(SignupScreen.routeName),
                              text: 'Sign up',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColor.textColor)),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    AppButton(
                      onPressed: logIn,
                      placeholder: isLoading
                          ? const CircularIndicator()
                          : Text('Log In',
                              style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
