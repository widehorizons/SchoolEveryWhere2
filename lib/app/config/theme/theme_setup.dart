import 'package:flutter/material.dart';

import '../utils/flavor_config.dart';
import 'theme.dart';

class ThemeConfig {
  static List<String> get themes => [
        'schoolEveryWhere',
        'tantaRoyal',
      ];

  static List<ThemeData> getThemes() {
    return [defaultTheme, alrowadTheme, darkTheme];
  }

  static ThemeData defaultTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Cairo',
      primaryColor: AppColors.primaryColor,
      shadowColor: Colors.black38,
      // scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        titleTextStyle: textTheme.titleLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo'),
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        centerTitle: true,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.primaryTypoColor,
        size: 18,
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor));
  static ThemeData alrowadTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Cairo',
      primaryColor: AppColors.confirmed,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        selectedItemColor: AppColors.confirmed,
        unselectedItemColor: Colors.grey,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.confirmed,
        elevation: 0,
        titleTextStyle: textTheme.titleLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo'),
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        centerTitle: true,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.primaryTypoColor,
        size: 18,
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppColors.confirmed));
  static ThemeData darkTheme = ThemeData.dark().copyWith(
      appBarTheme: FlavorConfig.instance.theme.appBarTheme,
      applyElevationOverlayColor: false,
      bottomNavigationBarTheme:
          FlavorConfig.instance.theme.bottomNavigationBarTheme.copyWith(
              selectedIconTheme: const IconThemeData(color: Colors.white)),
      iconTheme:
          FlavorConfig.instance.theme.iconTheme.copyWith(color: Colors.white),
      colorScheme: FlavorConfig.instance.theme.colorScheme
          .copyWith(secondary: Colors.black),
      textTheme: FlavorConfig.instance.theme.textTheme.apply(
          fontFamily: 'Cairo',
          displayColor: Colors.white,
          bodyColor: Colors.white));
}
