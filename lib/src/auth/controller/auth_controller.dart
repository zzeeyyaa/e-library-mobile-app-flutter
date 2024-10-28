import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthController();

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed('/home');
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed('/login');
  }

  Future<void> register() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed('/login');
  }
}
