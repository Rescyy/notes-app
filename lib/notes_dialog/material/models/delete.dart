import 'package:flutter/material.dart';

class MaterialNotesDeleteDialogModel extends StatelessWidget {
  const MaterialNotesDeleteDialogModel({super.key, 
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
      title: Text(topText),
      content: Text(warning),
      actions: [
        TextButton(
          style: const ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Colors.red),
          ),
          onPressed: onCancel,
          child: const Text('Cancel'),
        ),
        TextButton(
          style: const ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Colors.red),
          ),
          onPressed: onDelete,
          child: const Text('Delete'),
        ),
      ],
    );
  }
}