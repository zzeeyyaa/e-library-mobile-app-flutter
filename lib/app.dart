import 'package:e_library/core/routes/app_routes.dart';
import 'package:e_library/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Library',
      theme: theme,
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
    );
  }
}
