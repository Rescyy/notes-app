import 'package:assignment_2/notes_card/base/models/card.dart';
import 'package:assignment_2/notes_card/multiple_delete/models/icon.dart';
import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:flutter/material.dart';

class NotesCardMultipleDelete extends StatelessWidget {
  const NotesCardMultipleDelete({
    super.key,
    required this.noteData,
    required this.onDeleteTap,
    required this.isSelected,
  });

  final NoteData noteData;
  final void Function(bool) onDeleteTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return NotesCardModel(
      icons: [
        MultipleDeleteNotesIconModel(
          onTap: () {
            onDeleteTap(!isSelected);
          },
          isSelected: isSelected,
        ),
      ],
      noteData: noteData,
    );
  }
}
