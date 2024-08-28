import 'package:assignment_2/notes_card/default/models/card.dart';
import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_dialog/abstract/factory.dart';
import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({
    super.key,
    required this.noteData,
    required this.onNoteEditted,
    required this.onNoteDeleted,
    required this.onDeleteLongPress,
  });

  final NoteData noteData;
  final void Function(NoteData) onNoteEditted;
  final void Function() onNoteDeleted;
  final void Function() onDeleteLongPress;

  @override
  Widget build(BuildContext context) {
    final dialogFactory = NotesDialogFactory.of(context);
    return DefaultNotesCardModel(
      noteData: noteData,
      onNoteEditted: () {
        dialogFactory.showDialog(
          context: context,
          builder: (context) {
            return dialogFactory.createEditDialog(
              onNoteAccepted: onNoteEditted,
              noteData: noteData,
            );
          },
        );
      },
      onNoteDeleted: () {
        dialogFactory.showDialog(
          context: context,
          builder: (context) {
            return dialogFactory.createDeleteDialog(
              onDelete: onNoteDeleted,
            );
          },
        );
      },
      onDeleteLongPress: onDeleteLongPress,
    );
  }
}