import 'dart:developer';

import 'package:assignment_2/notes_card/default/class.dart';
import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_listview/empty.dart';
import 'package:assignment_2/notes_listview/model.dart';
import 'package:flutter/material.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
    this.initialNotes,
    required this.futureNotes,
    required this.onNoteEditted,
    required this.onNoteDeleted,
    required this.onToggleMultipleDelete,
    required this.scrollKey,
  });

  final Future<Map<int, NoteData>>? futureNotes;
  final Map<int, NoteData>? initialNotes;
  final void Function(NoteData, int) onNoteEditted;
  final void Function(int) onNoteDeleted;
  final void Function(int) onToggleMultipleDelete;
  final Key scrollKey;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: initialNotes,
      future: futureNotes,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.hasError) {
            log("Error", error: snapshot.error);
          }
          final notes = snapshot.data!.entries.toList();
          return notes.isEmpty
              ? const NotesEmpty()
              : NotesListViewModel(
                  scrollKey: scrollKey,
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return NotesCard(
                      noteData: notes[index].value,
                      onNoteEditted: (note) {
                        onNoteEditted(note, notes[index].key);
                      },
                      onNoteDeleted: () {
                        onNoteDeleted(notes[index].key);
                      },
                      onDeleteLongPress: () {
                        onToggleMultipleDelete(notes[index].key);
                      },
                    );
                  },
                );
        }
        if (snapshot.hasError) {
          log(snapshot.error.toString());
          return Center(
            child: Text('Error loading notes', style: TextStyle(color: Theme.of(context).colorScheme.error),),
          );
        }
        return Center(
          child: CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary),
        );
      },
    );
  }
}
