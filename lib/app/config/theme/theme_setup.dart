import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeConfig {
  static List<String> get themes => [
        'schoolEveryWhere',
        'Tanta Royal',
      ];

  static List<ThemeData> getThemes() {
    return [
      ThemeData(
          fontFamily: 'Cairo',
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
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
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: AppColors.primaryColor)),
      ThemeData(
          fontFamily: 'Cairo',
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
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
          backgroundColor: Colors.blueAccent,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent)),
    ];
  }
}
