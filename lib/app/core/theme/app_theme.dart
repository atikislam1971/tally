import 'package:flutter/material.dart';
import 'package:tally/app/core/theme/color.dart';

class AppTheme{
  static ThemeData light= ThemeData(
    brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor:  AppColors.primary,
      selectionHandleColor: Colors.amber
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1.5, color: AppColors.BLACK.withOpacity(.6)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1.5, color: AppColors.primary.withOpacity(.6)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1.5, color: AppColors.BLACK.withOpacity(.6)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1.5, color: AppColors.RED.withOpacity(.6)),
      ),
    )
  );
  static ThemeData dark= ThemeData(
      brightness: Brightness.dark
  );

}