import 'package:assignment_2/notes_body/drawer.dart';
import 'package:assignment_2/notes_body/models/add_action_button.dart';
import 'package:assignment_2/notes_body/models/body.dart';
import 'package:assignment_2/notes_body/states/abstract_state.dart';
import 'package:assignment_2/notes_body/states/multiple_delete_state.dart';
import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_dialog/abstract/factory.dart';
import 'package:assignment_2/notes_listview/class.dart';
import 'package:flutter/material.dart';

class NotesDefaultState extends NotesState {
  NotesDefaultState({
    required super.controller,
  });

  @override
  Widget build(BuildContext context) {
    final dialogFactory = NotesDialogFactory.of(context);
    return NotesBodyModel(
      floatingActionButton: NoteAddActionButtonModel(
        onPressed: () {
          dialogFactory.showDialog(
            context: context,
            builder: (context) {
              return dialogFactory.createAddDialog(
                onNoteAccepted: (NoteData note) async {
                  await controller.database.addNote(note);
                  controller.setState(() {});
                },
              );
            },
          );
        },
      ),
      drawer: NotesDrawer(
        themeMode: controller.widget.themeMode,
        onThemeChanged: controller.widget.onThemeChanged,
      ),
      child: NotesListView(
          scrollKey: controller.scrollKey,
          initialNotes: controller.database.notes,
          futureNotes: controller.database.futureNotes,
          onNoteEditted: (note, index) async {
            await controller.database.editNote(note, index);
            controller.setState(() {});
          },
          onNoteDeleted: (index) async {
            await controller.database.removeNote(index);
            controller.setState(() {});
          },
          onToggleMultipleDelete: toMultipleDelete),
    );
  }
}

extension ToDefault on NotesState {
  void toDefault() {
    controller.changeState(NotesDefaultState(controller: controller));
  }
}
