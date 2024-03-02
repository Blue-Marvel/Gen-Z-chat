import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsets padding = EdgeInsets.all(10.w);

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15.w,
      height: 15.w,
      child: const CircularProgressIndicator.adaptive(),
    );
  }
}
