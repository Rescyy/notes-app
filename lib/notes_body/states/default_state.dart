import 'package:assignment_2/notes_body/models/add_action_button.dart';
import 'package:assignment_2/notes_body/models/body.dart';
import 'package:assignment_2/notes_body/states/abstract_state.dart';
import 'package:assignment_2/notes_body/states/multiple_delete_state.dart';
import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_dialog/abstract/factory.dart';
import 'package:assignment_2/notes_scrollbar/class.dart';
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
          scrollKey: controller.scrollKey,
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
          onToggleMultipleDelete: toMultipleDelete),
    );
  }
}

extension ToDefault on NotesState {
  void toDefault() {
    controller.changeState(NotesDefaultState(controller: controller));
  }
}
