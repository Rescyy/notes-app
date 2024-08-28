import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_dialog/abstract/delete.dart';
import 'package:assignment_2/notes_dialog/cupertino/delete.dart';
import 'package:assignment_2/notes_dialog/cupertino/edit.dart';
import 'package:assignment_2/notes_dialog/abstract/factory.dart';
import 'package:assignment_2/notes_dialog/abstract/edit.dart';
import 'package:flutter/cupertino.dart';

class CupertinoNotesDialogFactory extends NotesDialogFactory {
  const CupertinoNotesDialogFactory();

  @override
  AbstractNotesDeleteDialog createDeleteDialog({required void Function() onDelete}) {
    return CupertinoNotesDeleteDialog(
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
    return CupertinoNotesEditDialog(
      onNoteAccepted: onNoteAccepted,
      topText: "Edit Note",
      noteData: noteData,
    );
  }

  @override
  NotesEditDialog createAddDialog({
    required void Function(NoteData) onNoteAccepted,
    NoteData? noteData,
  }) {
    return CupertinoNotesEditDialog(
      onNoteAccepted: onNoteAccepted,
      topText: "New Note",
      noteData: noteData,
    );
  }

  @override
  AbstractNotesDeleteDialog createMultipleDeleteDialog(
      {required void Function() onDelete, required int amount}) {
    return CupertinoNotesDeleteDialog(
      onDelete: onDelete,
      warning:
          "Are you sure you want to\ndelete $amount ${amount > 1 ? "notes" : "note"}?",
      topText: 'Delete notes?',
    );
  }

  @override
  void showDialog({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
  }) {
    showCupertinoDialog(context: context, builder: builder);
  }
}