import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';

class NoteAddActionButtonModel extends FloatingActionButton {
  const NoteAddActionButtonModel({
    super.key,
    required super.onPressed,
  }) : super(
          backgroundColor: NotesPallette.floatingButton,
          splashColor: NotesPallette.splashColor,
          foregroundColor: NotesPallette.buttonTextDark,
          child: const Icon(Icons.add),
        );
}