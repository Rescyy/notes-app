import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_edit_dialog.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:assignment_2/notes_list.dart';
import 'package:flutter/material.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({super.key});

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  final NotesDatabaseAbstract database = BibleNotesDatabase();

  @override
  Widget build(BuildContext context) {
    Widget front;
    if (database.notes.isEmpty) {
      front = const Center(
        child: Text(
          'Wow such empty :(',
          style: TextStyle(
            fontSize: 20,
            color: NotesPallette.textDark,
          ),
        ),
      );
    } else {
      front = Scrollbar(
        thickness: 8,
        radius: const Radius.circular(5),
        thumbVisibility: true,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
              child: NotesList(
                database: database,
                onNoteEditted: (note, index) {
                  setState(() {
                    database.editNote(note, index);
                  });
                },
                onNoteDeleted: (index) {
                  setState(() {
                    database.removeNote(index);
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      NotesPallette.background,
                      NotesPallette.backgroundTransparent
                    ],
                  ),
                ),
                height: 10,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      NotesPallette.background,
                      NotesPallette.backgroundTransparent
                    ],
                  ),
                ),
                height: 10,
              ),
            ),
          ],
        ),
      );
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
            barrierDismissible: false, // user must tap button!
            builder: (_) => NotesEditDialog(
              onNoteAccepted: (NoteData note) {
                setState(
                  () {
                    database.addNote(note);
                  },
                );
              },
              titleText: "New Note",
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 4, 80),
        child: SafeArea(
          top: false,
          child: SizedBox(
            child: front,
          ),
        ),
      ),
    );
  }
}
