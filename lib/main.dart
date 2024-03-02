import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_z_chat/presentation/view/utils/routes.dart';
import 'package:gen_z_chat/presentation/view/utils/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
          MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.theme(),
        routerConfig: route,
      ),
    );
  }
}
