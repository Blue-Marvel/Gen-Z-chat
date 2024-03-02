import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_z_chat/presentation/view/utils/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const routeName = '/dashboard';
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Gen Z',
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.textColor),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green,
              child: CircleAvatar(
                radius: 18,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            3,
            (index) => const Card(
              child: Text('data'),
            ),
          ),
        ),
      ),
    );
  }
}
