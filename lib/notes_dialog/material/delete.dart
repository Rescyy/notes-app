import 'package:assignment_2/notes_dialog/abstract/delete.dart';
import 'package:assignment_2/notes_dialog/material/models/delete.dart';
import 'package:flutter/material.dart';

class MaterialNotesDeleteDialog extends NotesDeleteDialog {
  const MaterialNotesDeleteDialog({
    super.key,
    required super.onDelete,
    required super.warning,
    required super.topText,
  });

  const MaterialNotesDeleteDialog.delete({
    super.key,
    required super.onDelete,
  }) : super.delete();

  const MaterialNotesDeleteDialog.multipleDelete({
    super.key,
    required super.onDelete,
    required super.amount,
  }) : super.multipleDelete();

  @override
  Widget build(BuildContext context) {
    return MaterialNotesDeleteDialogModel(
      onDelete: () {
        onDelete();
        Navigator.of(context).pop();
      },
      onCancel: Navigator.of(context).pop,
      warning: warning,
      topText: topText,
    );
  }
}
