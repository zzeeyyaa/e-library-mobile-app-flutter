import 'package:e_library/src/auth/view/login_view.dart';
import 'package:e_library/src/auth/view/regist_view.dart';
import 'package:e_library/src/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String profile = '/profile';

  static final List<GetPage> routes = [
    _buildPageRoute(home),
    _buildPageRoute(login),
    _buildPageRoute(register),
    _buildPageRoute(profile),
  ];

  static GetPage<dynamic> _buildPageRoute(
    String page, {
    List<GetMiddleware>? middlewares,
    Transition? transition,
  }) {
    return GetPage(
      name: page.runtimeType.toString(),
      page: () => _buildPage(page),
      middlewares: middlewares,
      transition: transition ?? Transition.fadeIn,
    );
  }

  static Widget _buildPage(String page) {
    switch (page) {
      case home:
        return HomeView.page();
      case login:
        return LoginView.page();
      case register:
        return RegistView.page();
      default:
        throw Exception('Invalid route: $page');
    }
  }
}
