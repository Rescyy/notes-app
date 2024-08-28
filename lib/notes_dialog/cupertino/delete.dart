import 'package:assignment_2/notes_dialog/abstract/delete.dart';
import 'package:assignment_2/notes_dialog/cupertino/models/delete.dart';
import 'package:flutter/cupertino.dart';

class CupertinoNotesDeleteDialog extends NotesDeleteDialog {
  const CupertinoNotesDeleteDialog({
    super.key,
    required super.onDelete,
    required super.warning,
    required super.topText,
  });

  const CupertinoNotesDeleteDialog.delete({
    super.key,
    required super.onDelete,
  }) : super.delete();

  const CupertinoNotesDeleteDialog.multipleDelete({
    super.key,
    required super.onDelete,
    required super.amount,
  }) : super.multipleDelete();

  @override
  Widget build(BuildContext context) {
    return CupertinoNotesDeleteDialogModel(
      onDelete: onDelete,
      topText: topText,
      warning: warning,
    );
  }
}
