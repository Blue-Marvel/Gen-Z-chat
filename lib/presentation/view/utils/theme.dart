import 'package:flutter/material.dart';
import 'package:gen_z_chat/presentation/view/utils/colors.dart';

class AppThemeData {
  static ThemeData theme() {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.textColor),
        scaffoldBackgroundColor: AppColor.backgroundColor,
        useMaterial3: true,
        cardColor: AppColor.backgroundColor,
        appBarTheme:
            const AppBarTheme(backgroundColor: AppColor.backgroundColor),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
                color: AppColor.greyTextColor, fontStyle: FontStyle.italic)),
        cardTheme: const CardTheme(color: AppColor.backgroundColor));
  }
}
