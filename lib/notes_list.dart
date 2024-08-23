import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_card.dart';
import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
  const NotesList(
      {super.key,
      required this.database,
      required this.onNoteEditted,
      required this.onNoteDeleted});
  final NotesDatabaseAbstract database;
  final void Function(NoteData, int) onNoteEditted;
  final void Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    final notes = database.notes;
    return ListView.separated(
      // primary: true,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NotesCard(
          title: notes[index].title,
          content: notes[index].content,
          onNoteEditted: (note) {
            onNoteEditted(note, index);
          },
          onNoteDeleted: () {
            onNoteDeleted(index);
          },
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
    );
  }
}
