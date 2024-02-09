import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/config/items/app_colors.dart';
import 'package:flutter_riverpod_example/config/routes/app_router.dart';
import 'package:flutter_riverpod_example/features/bottomNavbar/view/bottom_navbar.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie App',
      theme: ThemeData.light().copyWith(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          displaySmall: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            fontFamily: "Comfortaa",
            wordSpacing: 1.5,
          ),
          displayLarge: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 28,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          headlineMedium: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          headlineSmall: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          headlineLarge: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: 28,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          bodyMedium: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          bodySmall: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          bodyLarge: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          titleLarge: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          titleSmall: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          titleMedium: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          labelMedium: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          labelSmall: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
          labelLarge: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            wordSpacing: 1.5,
            fontFamily: "Comfortaa",
          ),
        ),
      ),
      // initialRoute: AppRouteNames.bottomAppBar,
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: const BottomNavbar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
