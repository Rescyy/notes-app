import 'package:assignment_2/notes_body/class.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeChangeNotifier(),
        builder: (context, child) {
          final provider = Provider.of<ThemeChangeNotifier>(context);
          return MaterialApp(
            themeMode: provider.themeMode,
            theme: NotesPallette.lightTheme,
            darkTheme: NotesPallette.darkTheme,
            home: const NotesBody(),
          );
        });
  }
}

class ThemeChangeNotifier extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  void toggleTheme() {
    // if (NotesPallette.isDark) {
    //   // NotesPallette.setLight();
    // } else {
    //   // NotesPallette.setDark();
    // }
    notifyListeners();
  }
}
