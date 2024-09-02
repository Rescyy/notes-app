import 'package:assignment_2/notes_card/multiple_delete/class.dart';
import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_listview/model.dart';
import 'package:flutter/material.dart';

class NotesListViewMultipleDelete extends StatelessWidget {
  const NotesListViewMultipleDelete({
    super.key,
    required this.notes,
    required this.onDeleteSelect,
    required this.selectedNotesIds,
    required this.scrollKey,
  });

  final List<MapEntry<int, NoteData>> notes;
  final void Function(bool, int) onDeleteSelect;
  final Set<int> selectedNotesIds;
  final Key scrollKey;

  @override
  Widget build(BuildContext context) {
    return NotesListViewModel(
      scrollKey: scrollKey,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NotesCardMultipleDelete(
          noteData: notes[index].value,
          onDeleteTap: (selected) {
            onDeleteSelect(selected, notes[index].key);
          },
          isSelected: selectedNotesIds.contains(notes[index].key),
        );
      },
    );
  }
}
