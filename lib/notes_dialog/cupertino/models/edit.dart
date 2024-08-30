import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNotesEditDialogModel extends StatelessWidget {
  const CupertinoNotesEditDialogModel({
    super.key,
    required this.formKey,
    required this.topText,
    required this.titleFocusNode,
    required this.titleController,
    required this.contentController,
    required this.onCancel,
    required this.onFinish,
  });

  final GlobalKey<FormState> formKey;
  final String topText;
  final FocusNode titleFocusNode;
  final TextEditingController titleController;
  final TextEditingController contentController;
  final void Function() onCancel;
  final void Function() onFinish;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(topText),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Title'),
            CupertinoTextFormFieldRow(
              maxLength: 30,
              focusNode: titleFocusNode,
              controller: titleController,
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.systemGrey),
                borderRadius: BorderRadius.circular(5),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title cannot be empty';
                }
                return null;
              },
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const Text('Content'),
            CupertinoTextFormFieldRow(
              maxLength: 200,
              minLines: 4,
              maxLines: 4,
              controller: contentController,
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.systemGrey),
                borderRadius: BorderRadius.circular(5),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Content cannot be empty';
                }
                return null;
              },
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: onCancel,
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: CupertinoColors.systemRed,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: onFinish,
          child: const Text(
            'Save',
            style: TextStyle(
              color:CupertinoColors.systemBlue,
            ),
          ),
        ),
      ],
    );
  }
}
