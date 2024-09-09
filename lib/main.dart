import 'package:assignment_2/notes_body/class.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: themeMode,
      theme: NotesPallette.lightTheme,
      darkTheme: NotesPallette.darkTheme,
      home: NotesBody(
        themeMode: themeMode,
        onThemeChanged: (themeMode) {
          setState(() {
            this.themeMode = themeMode;
          });
        },
      ),
    );
  }
}
