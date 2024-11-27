import 'package:expense_tracker/utils/project_colors.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

const ColorScheme kColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primary,
  onPrimary: accent,
  primaryContainer: secondary,
  secondary: secondary,
  onSecondary: secondaryLight,
  secondaryContainer: primaryDark,
  error: error,
  onError: errorDark,
  surface: primaryDark,
  onSurface: accent,
);

const ColorScheme kColorDarkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: secondary,
  onPrimary: secondaryLight,
  primaryContainer: accent,
  secondary: primary,
  onSecondary: primaryDark,
  secondaryContainer: secondaryLight,
  error: error,
  onError: errorDark,
  surface: secondaryLight,
  onSurface: secondaryLight,
);

ColorScheme kColorScheme2 = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 249, 170, 51),
);

ColorScheme kColorDarkScheme2 = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 52, 73, 85),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((fn) {
  runApp(
    MaterialApp(
      home: const Expenses(),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kColorDarkScheme,
        canvasColor: kColorDarkScheme.onSecondary,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorDarkScheme.primary,
          foregroundColor: kColorDarkScheme.secondary,
          centerTitle: true,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorDarkScheme.onSecondary,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        datePickerTheme: const DatePickerThemeData().copyWith(
          backgroundColor: kColorDarkScheme.surface,
          surfaceTintColor: kColorDarkScheme.surface,
          headerForegroundColor: kColorDarkScheme.secondary,
          weekdayStyle: TextStyle(color: kColorDarkScheme.secondary),
          rangePickerBackgroundColor: error,
          dayForegroundColor:
              WidgetStatePropertyAll(kColorDarkScheme.secondary),
          yearForegroundColor:
              WidgetStatePropertyAll(kColorDarkScheme.secondary),
          cancelButtonStyle: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(kColorDarkScheme.secondary),
          ),
          confirmButtonStyle: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(kColorDarkScheme.secondary),
          ),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
              /* Display */
              displayLarge: const TextStyle(
                color: secondary,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
              displayMedium: const TextStyle(
                color: primaryDark,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
              displaySmall: const TextStyle(
                color: secondaryLight,
                fontSize: 46,
                fontWeight: FontWeight.bold,
              ),

              /* Headline */
              headlineLarge: const TextStyle(
                color: secondary,
                fontSize: 34,
                fontWeight: FontWeight.normal,
              ),
              headlineMedium: const TextStyle(
                color: primaryDark,
                fontSize: 32,
                fontWeight: FontWeight.normal,
              ),
              headlineSmall: const TextStyle(
                color: secondaryLight,
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),

              /* Title */
              titleLarge: const TextStyle(
                fontWeight: FontWeight.normal,
                color: secondary,
                fontSize: 26,
              ),
              titleMedium: const TextStyle(
                fontWeight: FontWeight.normal,
                color: primaryDark,
                fontSize: 24,
              ),
              titleSmall: const TextStyle(
                fontWeight: FontWeight.normal,
                color: secondaryLight,
                fontSize: 22,
              ),

              /* Label */
              labelLarge: const TextStyle(
                color: secondary,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              labelMedium: const TextStyle(
                color: primaryDark,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              labelSmall: const TextStyle(
                color: secondaryLight,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),

              /* Body */
              bodyLarge: const TextStyle(
                color: secondary,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              bodyMedium: const TextStyle(
                color: primaryDark,
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
              bodySmall: const TextStyle(
                color: secondaryLight,
                fontSize: 8,
                fontWeight: FontWeight.normal,
              ),
            ),
      ),
      theme: ThemeData().copyWith(
        canvasColor: kColorScheme.secondaryContainer,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.secondary,
          centerTitle: true,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.onSecondary,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        datePickerTheme: const DatePickerThemeData().copyWith(
          backgroundColor: kColorDarkScheme.surface,
          surfaceTintColor: kColorDarkScheme.surface,
          headerForegroundColor: kColorDarkScheme.secondary,
          weekdayStyle: TextStyle(color: kColorDarkScheme.secondary),
          rangePickerBackgroundColor: error,
          dayForegroundColor:
              WidgetStatePropertyAll(kColorDarkScheme.secondary),
          yearForegroundColor:
              WidgetStatePropertyAll(kColorDarkScheme.secondary),
          cancelButtonStyle: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(kColorDarkScheme.secondary),
          ),
          confirmButtonStyle: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(kColorDarkScheme.secondary),
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              /* Display */
              displayLarge: const TextStyle(
                color: primaryDark,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
              displayMedium: const TextStyle(
                color: secondary,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
              displaySmall: const TextStyle(
                color: accent,
                fontSize: 46,
                fontWeight: FontWeight.bold,
              ),

              /* Headline */
              headlineLarge: const TextStyle(
                color: primaryDark,
                fontSize: 34,
                fontWeight: FontWeight.normal,
              ),
              headlineMedium: const TextStyle(
                color: secondary,
                fontSize: 32,
                fontWeight: FontWeight.normal,
              ),
              headlineSmall: const TextStyle(
                color: accent,
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),

              /* Title */
              titleLarge: const TextStyle(
                fontWeight: FontWeight.normal,
                color: primaryDark,
                fontSize: 26,
              ),
              titleMedium: const TextStyle(
                fontWeight: FontWeight.normal,
                color: secondary,
                fontSize: 24,
              ),
              titleSmall: const TextStyle(
                fontWeight: FontWeight.normal,
                color: accent,
                fontSize: 22,
              ),

              /* Label */
              labelLarge: const TextStyle(
                color: primaryDark,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              labelMedium: const TextStyle(
                color: secondary,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              labelSmall: const TextStyle(
                color: accent,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),

              /* Body */
              bodyLarge: const TextStyle(
                color: primaryDark,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              bodyMedium: const TextStyle(
                color: secondary,
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
              bodySmall: const TextStyle(
                color: accent,
                fontSize: 8,
                fontWeight: FontWeight.normal,
              ),
            ),
      ),
    ),
  );
  // });
}
