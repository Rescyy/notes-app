import 'package:flutter/widgets.dart';

abstract class NotesDeleteDialog extends StatelessWidget {
  const NotesDeleteDialog({
    super.key,
    required this.onDelete,
    required this.warning,
    required this.topText,
  });

  final String topText;
  final String warning;
  final void Function() onDelete;

  const NotesDeleteDialog.delete({
    super.key,
    required this.onDelete,
  })  : warning = 'Are you sure you want to delete this note?',
        topText = 'Delete Note?';

  const NotesDeleteDialog.multipleDelete({
    super.key,
    required this.onDelete,
    required int amount,
  })  : warning =
            "Are you sure you want to\ndelete $amount ${amount > 1 ? "notes" : "note"}?",
        topText = 'Delete notes?';
}
