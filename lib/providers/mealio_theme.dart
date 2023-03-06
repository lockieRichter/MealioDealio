import 'package:flutter/material.dart';
import 'package:mealio_dealio/providers/shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mealio_theme.g.dart';

@riverpod
class MealioTheme extends _$MealioTheme {
  @override
  ThemeMode build() {
    final sharedPrefs = ref.read(sharedPreferencesProvider);
    final themeMode = sharedPrefs.getString('themeMode');
    if (themeMode == 'dark') return ThemeMode.dark;

    return ThemeMode.light;
  }

  void setTheme(ThemeMode theme) {
    state = theme;
    ref.read(sharedPreferencesProvider).setString('themeMode', theme.name);
  }
}
