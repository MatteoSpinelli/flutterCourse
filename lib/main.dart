import 'package:app/widgets/expenses.dart';
import 'package:flutter/material.dart';

var globalTheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 38, 109, 232),
);

var globalDarkTheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: globalDarkTheme,
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: globalTheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: globalTheme.onPrimaryContainer,
        foregroundColor: globalTheme.primaryContainer,
      ),
    ),
    themeMode: ThemeMode.light,
    home: const Expenses(),
  ));
}
