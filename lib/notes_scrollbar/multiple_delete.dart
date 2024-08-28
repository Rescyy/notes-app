import 'package:assignment_2/notes_card/multiple_delete/class.dart';
import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_scrollbar/model.dart';
import 'package:flutter/material.dart';

class NotesScrollbarMultipleDelete extends StatelessWidget {
  const NotesScrollbarMultipleDelete({
    super.key,
    required this.notes,
    required this.onDeleteSelect,
    required this.selectedNotes,
    required this.scrollKey,
  });

  final List<NoteData> notes;
  final void Function(bool, int) onDeleteSelect;
  final Set<int> selectedNotes;
  final Key scrollKey;

  @override
  Widget build(BuildContext context) {
    return NotesScrollbarModel(
      scrollKey: scrollKey,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NotesCardMultipleDelete(
          noteData: notes[index],
          onDeleteTap: (selected) {
            onDeleteSelect(selected, index);
          },
          isSelected: selectedNotes.contains(index),
        );
      },
    );
  }
}