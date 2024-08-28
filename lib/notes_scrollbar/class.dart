
import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_scrollbar/empty.dart';
import 'package:assignment_2/notes_scrollbar/model.dart';
import 'package:flutter/material.dart';

class NotesScrollbar extends StatelessWidget {
  const NotesScrollbar({
    super.key,
    required this.notes,
    required this.onNoteEditted,
    required this.onNoteDeleted,
    required this.onToggleMultipleDelete,
    required this.scrollKey,
  });

  final List<NoteData> notes;
  final void Function(NoteData, int) onNoteEditted;
  final void Function(int) onNoteDeleted;
  final void Function(int) onToggleMultipleDelete;
  final Key scrollKey;

  @override
  Widget build(BuildContext context) {
    return notes.isEmpty
        ? const NotesEmpty()
        : NotesScrollbarModel(
            scrollKey: scrollKey,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NotesCard(
                noteData: notes[index],
                onNoteEditted: (note) {
                  onNoteEditted(note, index);
                },
                onNoteDeleted: () {
                  onNoteDeleted(index);
                },
                onDeleteLongPress: () {
                  onToggleMultipleDelete(index);
                },
              );
            },
          );
  }
}