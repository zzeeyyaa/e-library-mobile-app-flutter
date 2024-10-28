import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController();

  Future<void> updateProfile() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
  }

  Future<void> updatePhoto() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed('/login');
  }
}
