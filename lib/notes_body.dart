import 'package:assignment_2/notes_dialog/factory.dart';
import 'package:assignment_2/notes_scrollbar.dart';
import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({super.key});

  @override
  State<NotesBody> createState() => _NotesBodyController();
}

class _NotesBodyController extends State<NotesBody> {

  late _NotesState _state = _NotesDefaultState(controller: this);

  final NotesDatabaseAbstract database = BibleNotesDatabase();

  void changeState(_NotesState state) {
    super.setState(() {
      _state = state;
    });
  }

  @override
  void setState(void Function() fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return _state.build(context);
  }
}

abstract class _NotesState {
  _NotesState({
    required this.controller,
  });
  final _NotesBodyController controller;
  Widget build(BuildContext context);
}

class _NotesDefaultState extends _NotesState {
  _NotesDefaultState({
    required super.controller,
  });

  @override
  Widget build(BuildContext context) {
    final dialogFactory = PlatformSpecificNotesDialogFactory(context);
    return _NotesBodyModel(
      floatingActionButton: _NoteAddActionButtonModel(
        onPressed: () {
          dialogFactory.showDialogMethod(
            context: context,
            builder: (context) {
              return dialogFactory.createAddDialog(
                onNoteAccepted: (NoteData note) {
                  controller.setState(() {
                    controller.database.addNote(note);
                  });
                },
              );
            },
          );
        },
      ),
      child: NotesScrollbar(
          notes: controller.database.notes,
          onNoteEditted: (note, index) {
            controller.setState(() {
              controller.database.editNote(note, index);
            });
          },
          onNoteDeleted: (index) {
            controller.setState(() {
              controller.database.removeNote(index);
            });
          },
          onToggleMultipleDelete: (index) {
            controller.changeState(
              _NotesMultipleDeleteState(
                  controller: controller, selectedNote: index),
            );
          }),
    );
  }
}

class _NotesMultipleDeleteState extends _NotesState {
  _NotesMultipleDeleteState({
    required super.controller,
    required int selectedNote,
  }) : selectedNotes = {selectedNote};

  Set<int> selectedNotes;

  @override
  Widget build(BuildContext context) {
    return _NotesBodyModel(
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('Delete (${selectedNotes.length})'),
              onPressed: () {
                controller.database.removeNotes(selectedNotes);
                controller.changeState(
                  _NotesDefaultState(
                    controller: controller,
                  ),
                );
              },
            ),
            TextButton(child: const Text('Cancel'), onPressed: () {controller.changeState(
                  _NotesDefaultState(
                    controller: controller,
                  ),
                );})
          ],
        )
      ],
      child: NotesScrollbarMultipleDelete(
        notes: controller.database.notes,
        selectedNotes: selectedNotes,
        onDeleteSelect: (selected, index) {
          controller.setState(() {
            selected ? selectedNotes.add(index) : selectedNotes.remove(index);
          });
        },
      ),
    );
  }
}

class _NotesBodyModel extends StatelessWidget {
  const _NotesBodyModel({
    required this.child,
    this.floatingActionButton,
    this.persistentFooterButtons,
  });

  final Widget? floatingActionButton;
  final List<Widget>? persistentFooterButtons;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NotesPallette.background,
      appBar: AppBar(
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
