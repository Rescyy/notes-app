import 'package:assignment_2/notes_dialog/abstract/delete.dart';
import 'package:assignment_2/notes_dialog/material/models/delete.dart';
import 'package:flutter/material.dart';

class MaterialNotesDeleteDialog extends AbstractNotesDeleteDialog {
  const MaterialNotesDeleteDialog({super.key, 
    required super.onDelete,
    required super.warning,
    required super.topText,
  });

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
