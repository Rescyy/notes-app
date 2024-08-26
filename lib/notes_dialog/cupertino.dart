import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_dialog/factory.dart';

class CupertinoNotesDialogFactory extends NotesDialogFactory {
  const CupertinoNotesDialogFactory();

  @override
  NotesDeleteDialog createDeleteDialog({required void Function() onDelete}) {
    // TODO: implement createDeleteDialog
    throw UnimplementedError();
  }

  @override
  NotesEditDialog createEditDialog({
    required void Function(NoteData p1) onNoteAccepted,
    NoteData? noteData,
  }) {
    // TODO: implement createEditDialog
    throw UnimplementedError();
  }

  @override
  NotesEditDialog createAddDialog({
    required void Function(NoteData p1) onNoteAccepted,
    NoteData? noteData,
  }) {
    // TODO: implement createAddDialog
    throw UnimplementedError();
  }
}
