import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_dialog/abstract/delete.dart';
import 'package:assignment_2/notes_dialog/cupertino/delete.dart';
import 'package:assignment_2/notes_dialog/cupertino/edit.dart';
import 'package:assignment_2/notes_dialog/abstract/factory.dart';
import 'package:assignment_2/notes_dialog/abstract/edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNotesDialogFactory extends NotesDialogFactory {
  const CupertinoNotesDialogFactory();

  @override
  NotesDeleteDialog createDeleteDialog({required void Function() onDelete}) {
    return CupertinoNotesDeleteDialog.delete(
      onDelete: onDelete,
    );
  }

  @override
  NotesEditDialog createEditDialog({
    required void Function(NoteData) onNoteAccepted,
    NoteData? noteData,
  }) {
    return CupertinoNotesEditDialog.edit(
      onNoteAccepted: onNoteAccepted,
      noteData: noteData,
    );
  }

  @override
  NotesEditDialog createAddDialog({
    required void Function(NoteData) onNoteAccepted,
    NoteData? noteData,
  }) {
    return CupertinoNotesEditDialog.add(
      onNoteAccepted: onNoteAccepted,
      noteData: noteData,
    );
  }

  @override
  NotesDeleteDialog createMultipleDeleteDialog(
      {required void Function() onDelete, required int amount}) {
    return CupertinoNotesDeleteDialog.multipleDelete(
      onDelete: onDelete,
      amount: amount,
    );
  }

  @override
  void showDialog({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (context) => Theme(
        data: ThemeData(
          cupertinoOverrideTheme: CupertinoThemeData(
            brightness: Theme.of(context).brightness,
          ),
        ),
        child: builder(context),
      ),
    );
  }
}
