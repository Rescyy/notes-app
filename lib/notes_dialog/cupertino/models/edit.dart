import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/cupertino.dart';

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
            ),
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: onCancel,
          child: Text(
            'Cancel',
            style: TextStyle(
              color: NotesPallette.of(context).cupertinoDialogActionNegative,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: onFinish,
          child: Text(
            'Save',
            style: TextStyle(
              color: NotesPallette.of(context).cupertinoDialogActionPositive,
            ),
          ),
        ),
      ],
    );
  }
}
