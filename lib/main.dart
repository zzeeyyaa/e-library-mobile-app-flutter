import 'package:e_library/app.dart';
import 'package:e_library/bootstrap.dart';
import 'package:e_library/core/database/db_helper.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}

Future<void> initializeDatabase() async {
  const databaseHelper = DatabaseHelper();
  await databaseHelper.initializeDatabase();
}


// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }
