import 'package:assignment_2/notes_card/base/models/card.dart';
import 'package:assignment_2/notes_card/base/models/icon.dart';
import 'package:flutter/material.dart';

class DefaultNotesCardModel extends NotesCardModel {
  DefaultNotesCardModel({
    super.key,
    required super.noteData,
    required VoidCallback onNoteEditted,
    required VoidCallback onNoteDeleted,
    required VoidCallback onDeleteLongPress,
  }) : super(
          icons: [
            NotesIconModel(
              onTap: onNoteEditted,
              iconData: Icons.edit,
            ),
            NotesIconModel(
              onTap: onNoteDeleted,
              onLongPress: onDeleteLongPress,
              iconData: Icons.delete_outline,
            ),
          ],
        );
}
