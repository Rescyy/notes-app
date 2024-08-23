import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_list.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';

class NotesEmptyBodyModel extends StatelessWidget {
  const NotesEmptyBodyModel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Wow such empty :(',
        style: TextStyle(
          fontSize: 20,
          color: NotesPallette.textDark,
        ),
      ),
    );
  }
}

class NotesScrollbar extends StatelessWidget {
  const NotesScrollbar(
      {super.key,
      required this.database,
      required this.onNoteEditted,
      required this.onNoteDeleted});

  final NotesDatabaseAbstract database;
  final void Function(NoteData, int) onNoteEditted;
  final void Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return NotesScrollbarModel(
      child: NotesList(
        database: database,
        onNoteEditted: onNoteEditted,
        onNoteDeleted: onNoteDeleted,
      ),
    );
  }
}

class NotesScrollbarModel extends StatelessWidget {
  const NotesScrollbarModel({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 8,
      radius: const Radius.circular(5),
      thumbVisibility: true,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
            child: child,
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
}
