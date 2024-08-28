import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:flutter/widgets.dart';

abstract class NotesEditDialog extends StatefulWidget {
  const NotesEditDialog(
      {super.key,
      required this.onNoteAccepted,
      this.noteData,
      required this.topText});

  final void Function(NoteData) onNoteAccepted;
  final NoteData? noteData;
  final String topText;

  const NotesEditDialog.edit({
    super.key,
    required this.onNoteAccepted,
    this.noteData,
  }) : topText = "Edit Note";

  const NotesEditDialog.add({
    super.key,
    required this.onNoteAccepted,
    this.noteData,
  }) : topText = "Add Note";
}
