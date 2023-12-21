import 'package:expense_tracker/expenses_app.dart';
import 'package:flutter/material.dart';

// Global variables starts with the 'k' character
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: kColorScheme.onSecondaryContainer,
            ),
            displaySmall: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: kColorScheme.primaryContainer,
            ),
          ),
    ),
    home: const ExpensesApp(),
  ));
}
