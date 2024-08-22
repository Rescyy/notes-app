import 'package:assignment_2/notes_pallette.dart';
import 'package:assignment_2/noteslist.dart';
import 'package:flutter/material.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: NotesPallette.background,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: NotesPallette.background,
          title: const Text('Notes'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: NotesPallette.floatingButton,
          splashColor: NotesPallette.splashColor,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 4, 80),
          child: SafeArea(
            top: false,
            child: SizedBox(
              child: Scrollbar(
                thickness: 8,
                radius: const Radius.circular(5),
                thumbVisibility: true,
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 18, 0),
                      child: Noteslist(),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
