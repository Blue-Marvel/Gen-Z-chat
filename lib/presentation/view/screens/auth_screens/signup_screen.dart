import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gen_z_chat/presentation/controller/auth_provider.dart';
import 'package:gen_z_chat/presentation/view/screens/auth_screens/login_screen.dart';
import 'package:gen_z_chat/presentation/view/utils/colors.dart';
import 'package:gen_z_chat/presentation/view/utils/utils.dart';
import 'package:gen_z_chat/presentation/view/widgets/app_button.dart';
import 'package:gen_z_chat/presentation/view/widgets/app_input_field.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  static const routeName = '/signup';

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  void signIn() async {
    final formValidate = _formKey.currentState?.validate();
    if (!formValidate!) return;
    _formKey.currentState?.save();

    setState(() {
      isLoading = true;
    });

    try {
      await ref.read(authProvider).registerUser(
            fullName: fullNameController.text,
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
      // ignore: use_build_context_synchronously
      context.push(LoginScreen.routeName);
    } catch (e) {
      print("Error registering $e");
    }

    setState(() {
      isLoading = false;
    });
// miniown@exelica.com
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
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
                    const Text('Welcome aboard! Let\'s get started! 🚀 '),
                    Gap(30.h),
                    AppInputField(
                      hintText: 'Full Name...',
                      editingController: fullNameController,
                    ),
                    Gap(10.h),
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
                    Gap(10.h),
                    AppInputField(
                      hintText: 'Confirm Password...',
                      editingController: confirmPasswordController,
                    ),
                    Gap(20.h),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Already have an account? ',
                              style: Theme.of(context).textTheme.bodyMedium),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => context.push(LoginScreen.routeName),
                              text: 'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColor.textColor)),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    AppButton(
                      onPressed: signIn,
                      placeholder: isLoading
                          ? const CircularIndicator()
                          : Text('Sign Up',
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
