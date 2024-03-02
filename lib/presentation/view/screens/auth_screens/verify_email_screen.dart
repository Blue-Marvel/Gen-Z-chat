import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gap/gap.dart';
import 'package:gen_z_chat/presentation/view/screens/auth_screens/login_screen.dart';
import 'package:gen_z_chat/presentation/view/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});
  static const routeName = '/verify-email';
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hey! Got the code in your inbox? Pop it in here, and let's get rolling! 📧💬",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Gap(18.h),
              VerificationCode(
                fullBorder: true,
                length: 6,
                keyboardType: TextInputType.number,
                margin: EdgeInsets.all(3.sp),
                padding: EdgeInsets.all(10.sp),
                onCompleted: (value) {},
                onEditing: (value) {
                  if (!value) FocusScope.of(context).unfocus();
                },
              ),
              Gap(36.h),
              AppButton(
                onPressed: () => context.go(LoginScreen.routeName),
                placeholder: const Text('Verify Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
