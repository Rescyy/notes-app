import 'package:assignment_2/notes_body/class.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: NotesPallette.lightTheme,
      home: const NotesBody(),
    );
  }
}
