import 'package:flutter/material.dart';

class MaterialNotesDeleteDialogModel extends StatelessWidget {
  const MaterialNotesDeleteDialogModel({
    super.key,
    required this.onDelete,
    required this.onCancel,
    required this.topText,
    required this.warning,
  });

  final void Function() onDelete;
  final void Function() onCancel;
  final String topText;
  final String warning;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        topText,
        textAlign: TextAlign.center,
      ),
      content: Text(warning),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          onPressed: onCancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.secondary,
            ),
            foregroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          onPressed: onDelete,
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
