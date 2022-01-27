import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:task_dashboard/app/config/routes/app_pages.dart';
import 'package:task_dashboard/app/config/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Daily Task",
      theme: AppTheme.basic,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
