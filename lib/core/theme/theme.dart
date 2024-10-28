import 'package:e_library/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

final ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: AppColors.primaryColor,
);

final theme = ThemeData(
  colorScheme: colorScheme,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    modalBackgroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      overlayColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  dialogBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
      titleLarge: TextStyle(
    fontWeight: FontWeight.w600,
  )),
  useMaterial3: true,
  timePickerTheme: TimePickerThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: Colors.white,
    // hourMinuteColor: WidgetStateColor.resolveWith((states) =>
    //     states.contains(WidgetState.selected)
    //         ? Colors.blue.withOpacity(0.2)
    //         : Colors.orange),
    // hourMinuteTextColor: WidgetStateColor.resolveWith((states) =>
    //     states.contains(WidgetState.selected)
    //         ? Colors.pink
    //         : Colors.deepPurple),
    // dialHandColor: Colors.pink.shade800,
    // dialBackgroundColor: Colors.purple.withOpacity(0.5),
    // dialTextColor: WidgetStateColor.resolveWith((states) =>
    //     states.contains(WidgetState.selected) ? Colors.green : Colors.black),
    // entryModeIconColor: Colors.yellow,
  ),
);
