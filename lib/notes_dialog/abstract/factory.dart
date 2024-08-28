import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_dialog/abstract/delete.dart';
import 'package:assignment_2/notes_dialog/abstract/edit.dart';
import 'package:assignment_2/notes_dialog/cupertino/factory.dart';
import 'package:assignment_2/notes_dialog/material/factory.dart';
import 'package:flutter/material.dart';

abstract class NotesDialogFactory {
  const NotesDialogFactory();

  void showDialog({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
  });

  NotesEditDialog createEditDialog({
    required void Function(NoteData) onNoteAccepted,
    NoteData? noteData,
  });

  NotesEditDialog createAddDialog({
    required void Function(NoteData) onNoteAccepted,
    NoteData? noteData,
  });

  NotesDeleteDialog createDeleteDialog({
    required void Function() onDelete,
  });

  NotesDeleteDialog createMultipleDeleteDialog({
    required void Function() onDelete,
    required int amount,
  });

  factory NotesDialogFactory.of(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return const CupertinoNotesDialogFactory();
    } else {
      return const MaterialNotesDialogFactory();
    }
  }
}
