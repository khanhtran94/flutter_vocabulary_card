import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'app_services.dart';
import '../features/flashcard/controllers/create_flashcards_controller.dart';
import '../features/flashcard/controllers/paste_analysis_controller.dart';
import '../features/flashcard/controllers/vocabulary_library_controller.dart';
import '../core/constants/review_intervals.dart';

part '../core/app_colors.dart';
part '../utils/scale.dart';
part '../widgets/shared_widgets.dart';
part '../screens/home/dashboard_screen.dart';
part '../screens/create/create_screens.dart';
part '../screens/study/study_screens.dart';
part '../screens/library/library_screens.dart';
part '../screens/review/review_screens.dart';

class VocabularyApp extends StatelessWidget {
  const VocabularyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VocabFlow',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              brightness: Brightness.light,
              surface: AppColors.surface,
            ).copyWith(
              primary: AppColors.primary,
              secondary: AppColors.secondary,
              tertiary: AppColors.tertiary,
              surface: AppColors.surface,
            ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            height: 1.25,
            letterSpacing: -0.4,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.25,
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.25,
          ),
          bodyLarge: TextStyle(fontSize: 18, height: 1.45),
          bodyMedium: TextStyle(fontSize: 16, height: 1.45),
          bodySmall: TextStyle(fontSize: 14, height: 1.4),
        ),
      ),
      home: const ScreenGalleryPage(),
    );
  }
}
