

import 'package:assignment_2/notes_dialog/abstract/delete.dart';
import 'package:assignment_2/notes_dialog/cupertino/models/delete.dart';
import 'package:flutter/cupertino.dart';

class CupertinoNotesDeleteDialog extends AbstractNotesDeleteDialog {
  const CupertinoNotesDeleteDialog({
    super.key,
    required super.onDelete,
    required super.warning,
    required super.topText,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoNotesDeleteDialogModel(
      onDelete: onDelete,
      topText: topText,
      warning: warning,
    );
  }
}