import 'package:assignment_2/notes_dialog/factory.dart';
import 'package:assignment_2/notes_scrollbar.dart';
import 'package:assignment_2/notes_database.dart';
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
  bool showBottom = false;

  @override
  Widget build(BuildContext context) {
    final dialogFactory = PlatformSpecificNotesDialogFactory(context);
    return _NotesBodyModel(
      floatingActionButton: showBottom
          ? null
          : _NoteAddActionButtonModel(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return dialogFactory.createEditDialog(
                      topText: "New Note",
                      onNoteAccepted: (NoteData note) {
                        setState(() {
                          database.addNote(note);
                        });
                      },
                    );
                  },
                );
              },
            ),
      persistentFooterButtons: !showBottom
          ? null
          : [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text('Yes'),
                    onPressed: () {},
                  ),
                ],
              )
            ],
      onLeadingPressed: () {
        setState(() {
          showBottom = !showBottom;
        });
      },
      child: NotesScrollbar(
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
        },
      ),
    );
  }
}

class _NotesBodyModel extends StatelessWidget {
  const _NotesBodyModel({
    required this.child,
    required this.onLeadingPressed,
    this.floatingActionButton,
    this.persistentFooterButtons,
  });

  final Widget? floatingActionButton;
  final List<Widget>? persistentFooterButtons;
  final void Function() onLeadingPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NotesPallette.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onLeadingPressed,
        ),
        scrolledUnderElevation: 0.0,
        backgroundColor: NotesPallette.background,
        title: const Text('Notes'),
      ),
      floatingActionButton: floatingActionButton,
      persistentFooterButtons: persistentFooterButtons,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 4, 0),
          child: child,
        ),
      ),
    );
  }
}

class _NoteAddActionButtonModel extends FloatingActionButton {
  const _NoteAddActionButtonModel({
    required super.onPressed,
  }) : super(
          backgroundColor: NotesPallette.floatingButton,
          splashColor: NotesPallette.splashColor,
          foregroundColor: NotesPallette.buttonTextDark,
          child: const Icon(Icons.add),
        );
}
