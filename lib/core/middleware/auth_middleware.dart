import 'package:e_library/core/routes/app_routes.dart';
import 'package:e_library/core/utils/storage_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (BoxUtils.isLoggedIn != null) {
      if (BoxUtils.isLoggedIn == false && route != AppRoutes.login) {
        return const RouteSettings(name: AppRoutes.login);
      } else {
        return const RouteSettings(name: AppRoutes.home);
      }
    }
    return null;
  }
}
