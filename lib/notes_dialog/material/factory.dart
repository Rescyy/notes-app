import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_dialog/abstract/delete.dart';
import 'package:assignment_2/notes_dialog/abstract/edit.dart';
import 'package:assignment_2/notes_dialog/abstract/factory.dart';
import 'package:assignment_2/notes_dialog/material/delete.dart';
import 'package:assignment_2/notes_dialog/material/edit.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/material/dialog.dart' as material_dialog;

class MaterialNotesDialogFactory extends NotesDialogFactory {
  const MaterialNotesDialogFactory();

  @override
  AbstractNotesDeleteDialog createDeleteDialog(
      {required void Function() onDelete}) {
    return MaterialNotesDeleteDialog(
      onDelete: onDelete,
      warning: 'Are you sure you want to delete this note?',
      topText: 'Delete Note?',
    );
  }

  @override
  NotesEditDialog createEditDialog({
    required void Function(NoteData) onNoteAccepted,
    NoteData? noteData,
  }) {
    return MaterialNotesEditDialog(
        onNoteAccepted: onNoteAccepted,
        topText: "New Note",
        noteData: noteData);
  }

  @override
  NotesEditDialog createAddDialog({
    required void Function(NoteData p1) onNoteAccepted,
    NoteData? noteData,
  }) {
    return MaterialNotesEditDialog(
        onNoteAccepted: onNoteAccepted,
        topText: "Edit Note",
        noteData: noteData);
  }

  @override
  void showDialog({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
  }) {
    material_dialog.showDialog<void>(
      context: context,
      builder: builder,
    );
  }

  @override
  AbstractNotesDeleteDialog createMultipleDeleteDialog(
      {required void Function() onDelete, required int amount}) {
    return MaterialNotesDeleteDialog(
      onDelete: onDelete,
      warning:
          "Are you sure you want to\ndelete $amount ${amount > 1 ? "notes" : "note"}?",
      topText: 'Delete notes?',
    );
  }
}
