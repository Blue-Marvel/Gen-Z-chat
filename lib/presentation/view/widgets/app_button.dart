import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_z_chat/presentation/view/utils/colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget placeholder;
  const AppButton(
      {super.key, required this.onPressed, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        width: 200.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColor.textColor, borderRadius: BorderRadius.circular(20)),
        child: placeholder,
      ),
    );
  }
}
