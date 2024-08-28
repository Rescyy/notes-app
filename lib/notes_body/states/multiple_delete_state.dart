import 'package:assignment_2/notes_body/models/body.dart';
import 'package:assignment_2/notes_body/states/default_state.dart';
import 'package:assignment_2/notes_body/states/interface_state.dart';
import 'package:assignment_2/notes_dialog/abstract/factory.dart';
import 'package:assignment_2/notes_scrollbar/multiple_delete.dart';
import 'package:flutter/material.dart';

class NotesMultipleDeleteState extends NotesState {
  NotesMultipleDeleteState({
    required super.controller,
    required int selectedNote,
  }) : selectedNotes = {selectedNote};

  Set<int> selectedNotes;

  @override
  Widget build(BuildContext context) {
    final dialogFactory = NotesDialogFactory.of(context);
    return NotesBodyModel(
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('Delete (${selectedNotes.length})'),
              onPressed: () {
                if (selectedNotes.isEmpty) {
                  return;
                }
                dialogFactory.showDialog(
                  context: context,
                  builder: (context) {
                    return dialogFactory.createMultipleDeleteDialog(
                      amount: selectedNotes.length,
                      onDelete: () {
                        controller.database.removeNotes(selectedNotes);
                        controller.changeState(
                          NotesDefaultState(controller: controller),
                        );
                      },
                    );
                  },
                );
              },
            ),
            TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  controller.changeState(
                    NotesDefaultState(controller: controller),
                  );
                })
          ],
        )
      ],
      child: NotesScrollbarMultipleDelete(
        scrollKey: controller.scrollKey,
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
