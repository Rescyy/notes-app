import 'package:assignment_2/notes_body/models/drawer.dart';
import 'package:flutter/material.dart';

class NotesDrawer extends Drawer {
  final ThemeMode themeMode;
  final void Function(ThemeMode) onThemeChanged;

  bool _themeSwitchValue(BuildContext context) {
    switch (themeMode) {
      case ThemeMode.system:
        return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
      case ThemeMode.light:
        return false;
      case ThemeMode.dark:
        return true;
    }
  }

  const NotesDrawer({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return NotesDrawerModel(
      onThemeToggle: (bool themeSwitchValue) {
        onThemeChanged(
          themeSwitchValue ? ThemeMode.dark : ThemeMode.light,
        );
      },
      themeSwitchValue: _themeSwitchValue(context),
    );
  }
}
