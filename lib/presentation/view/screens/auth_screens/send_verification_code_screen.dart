import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gen_z_chat/presentation/controller/auth_provider.dart';
import 'package:gen_z_chat/presentation/view/screens/auth_screens/verify_email_screen.dart';
import 'package:gen_z_chat/presentation/view/screens/home.dart';
import 'package:gen_z_chat/presentation/view/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class SendEmailCodeScreen extends ConsumerStatefulWidget {
  const SendEmailCodeScreen({super.key});
  static const routeName = '/send-code';
  @override
  ConsumerState<SendEmailCodeScreen> createState() =>
      _SendEmailCodeScreenState();
}

class _SendEmailCodeScreenState extends ConsumerState<SendEmailCodeScreen> {
  void sendCode() async {
    try {
      await ref.read(authProvider).sendEmailCode();
      // ignore: use_build_context_synchronously
      context.go(VerifyEmailScreen.routeName);
      print("success");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hey there! Ready to rock? Just give that button a tap to shoot over the verification email code. Let's do this! 🚀",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Gap(24.h),
            AppButton(
                onPressed: () => context.push(VerifyEmailScreen.routeName),
                placeholder: const Text('Send Code')),
            Gap(20.h),
            TextButton(
              onPressed: () {
                context.go(HomeMenu.routeName);
              },
              child: const Text("Skip"),
            ),
          ],
        ),
      ),
    );
  }
}
