import 'package:e_library/app.dart';
import 'package:e_library/bootstrap.dart';
import 'package:e_library/core/database/db_helper.dart';
import 'package:e_library/core/utils/storage_utils.dart';
import 'package:e_library/src/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BoxUtils.init();
  _initializeDatabase();
  _registerController();
  bootstrap(() => const App());
}

Future<void> _initializeDatabase() async {
  const databaseHelper = DatabaseHelper();
  await databaseHelper.initializeDatabase();
}

void _registerController() {
  Get.put(AuthController());
}
