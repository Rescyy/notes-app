import 'package:assignment_2/notes_body/drawer.dart';
import 'package:assignment_2/notes_body/models/body.dart';
import 'package:assignment_2/notes_body/models/footer_button.dart';
import 'package:assignment_2/notes_body/states/default_state.dart';
import 'package:assignment_2/notes_body/states/abstract_state.dart';
import 'package:assignment_2/notes_dialog/abstract/factory.dart';
import 'package:assignment_2/notes_listview/multiple_delete.dart';
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
            NotesFooterButtonModel(
              text: 'Delete (${selectedNotes.length})',
              onPressed: () {
                if (selectedNotes.isEmpty) {
                  return;
                }
                dialogFactory.showDialog(
                  context: context,
                  builder: (context) {
                    return dialogFactory.createMultipleDeleteDialog(
                      amount: selectedNotes.length,
                      onDelete: () async {
                        await controller.database.removeNotes(selectedNotes);
                        toDefault();
                      },
                    );
                  },
                );
              },
            ),
            NotesFooterButtonModel(
              text: 'Cancel',
              onPressed: toDefault,
            )
          ],
        )
      ],
      onDrawerOpened: toDefault,
      drawer: NotesDrawer(
        themeMode: controller.widget.themeMode,
        onThemeChanged: controller.widget.onThemeChanged,
      ),
      child: NotesListViewMultipleDelete(
        scrollKey: controller.scrollKey,
        // forced null, only way to reach this state if it was not null
        notes: controller.database.notes!.entries.toList(),
        selectedNotesIds: selectedNotes,
        onDeleteSelect: (selected, index) {
          controller.setState(() {
            selected ? selectedNotes.add(index) : selectedNotes.remove(index);
          });
        },
      ),
    );
  }
}

extension ToMultipleDelete on NotesState {
  void toMultipleDelete(int index) {
    controller.changeState(
      NotesMultipleDeleteState(controller: controller, selectedNote: index),
    );
  }
}
