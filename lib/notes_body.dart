import 'package:assignment_2/notes_scrollbar.dart';
import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_dialog.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({super.key});

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  final NotesDatabaseAbstract database = BibleNotesDatabase();
  // final NotesDatabaseAbstract database = NotesDatabase();

  @override
  Widget build(BuildContext context) {
    Widget front;
    if (database.notes.isEmpty) {
      front = const NotesEmptyBodyModel();
    } else {
      front = NotesScrollbar(
          notes: database.notes,
          onNoteEditted: (note, index) {
            setState(() {
              database.editNote(note, index);
            });
          },
          onNoteDeleted: (index) {
            setState(() {
              database.removeNote(index);
            });
          });
    }
    return Scaffold(
      backgroundColor: NotesPallette.background,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: NotesPallette.background,
        title: const Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: NotesPallette.floatingButton,
        splashColor: NotesPallette.splashColor,
        foregroundColor: NotesPallette.buttonTextDark,
        onPressed: () {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (_) => NotesEditDialog(
              topText: "New Note",
              onNoteAccepted: (NoteData note) {
                setState(
                  () {
                    database.addNote(note);
                  },
                );
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 4, 0),
          child: front,
        ),
      ),
    );
  }
}
