import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_dialog/cupertino.dart';
import 'package:assignment_2/notes_dialog/material.dart';
import 'package:flutter/material.dart';

abstract class NotesDialogFactory {
  const NotesDialogFactory();
  NotesEditDialog createEditDialog(
      {required void Function(NoteData) onNoteAccepted,
      NoteData? noteData,
      required String topText});
  NotesDeleteDialog createDeleteDialog({required void Function() onDelete});
}

class PlatformSpecificNotesDialogFactory extends NotesDialogFactory {
  PlatformSpecificNotesDialogFactory(BuildContext context)
      : factory = _chooseFactory(context);

  static NotesDialogFactory _chooseFactory(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return const CupertinoNotesDialogFactory();
    } else {
      return const MaterialNotesDialogFactory();
    }
  }

  final NotesDialogFactory factory;

  @override
  NotesDeleteDialog createDeleteDialog({required void Function() onDelete}) {
    return factory.createDeleteDialog(
      onDelete: onDelete,
    );
  }

  @override
  NotesEditDialog createEditDialog(
      {required void Function(NoteData p1) onNoteAccepted,
      NoteData? noteData,
      required String topText}) {
    return factory.createEditDialog(
      onNoteAccepted: onNoteAccepted,
      noteData: noteData,
      topText: topText,
    );
  }
}

abstract class NotesEditDialog extends StatefulWidget {
  const NotesEditDialog(
      {super.key,
      required this.onNoteAccepted,
      this.noteData,
      required this.topText});

  final void Function(NoteData) onNoteAccepted;
  final NoteData? noteData;
  final String topText;
}

abstract class NotesDeleteDialog extends StatelessWidget {
  const NotesDeleteDialog({super.key, required this.onDelete});

  final void Function() onDelete;
}
