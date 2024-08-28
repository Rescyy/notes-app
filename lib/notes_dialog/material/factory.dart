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
  NotesDeleteDialog createDeleteDialog({required void Function() onDelete}) {
    return MaterialNotesDeleteDialog.delete(
      onDelete: onDelete,
    );
  }

  @override
  NotesEditDialog createEditDialog({
    required void Function(NoteData) onNoteAccepted,
    NoteData? noteData,
  }) {
    return MaterialNotesEditDialog.edit(
      onNoteAccepted: onNoteAccepted,
      noteData: noteData,
    );
  }

  @override
  NotesEditDialog createAddDialog({
    required void Function(NoteData p1) onNoteAccepted,
    NoteData? noteData,
  }) {
    return MaterialNotesEditDialog.add(
      onNoteAccepted: onNoteAccepted,
      noteData: noteData,
    );
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
  NotesDeleteDialog createMultipleDeleteDialog(
      {required void Function() onDelete, required int amount}) {
    return MaterialNotesDeleteDialog.multipleDelete(
      onDelete: onDelete,
      amount: amount,
    );
  }
}
