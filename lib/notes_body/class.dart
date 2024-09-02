import 'package:assignment_2/notes_body/controller.dart';
import 'package:flutter/material.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({
    super.key,
    required this.onThemeChanged,
    required this.themeMode,
  });

  final void Function(ThemeMode) onThemeChanged;
  final ThemeMode themeMode;

  @override
  State<NotesBody> createState() => NotesBodyController();
}
