import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_dialog/factory.dart';
import 'package:flutter/cupertino.dart';

class CupertinoNotesDialogFactory extends NotesDialogFactory {
  const CupertinoNotesDialogFactory();

  @override
  NotesDeleteDialog createDeleteDialog({required void Function() onDelete}) {
    return _CupertinoNotesDeleteDialog(onDelete: onDelete);
  }

  @override
  NotesEditDialog createEditDialog({
    required void Function(NoteData p1) onNoteAccepted,
    NoteData? noteData,
  }) {
    return _CupertinoNotesEditDialog(
      onNoteAccepted: onNoteAccepted,
      topText: "Edit Note",
      noteData: noteData,
    );
  }

  @override
  NotesEditDialog createAddDialog({
    required void Function(NoteData p1) onNoteAccepted,
    NoteData? noteData,
  }) {
    return _CupertinoNotesEditDialog(
      onNoteAccepted: onNoteAccepted,
      topText: "New Note",
      noteData: noteData,
    );
  }

  @override
  void showDialogMethod({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
  }) {
    showCupertinoDialog(context: context, builder: builder);
  }
}

class _CupertinoNotesDeleteDialog extends NotesDeleteDialog {
  const _CupertinoNotesDeleteDialog({required super.onDelete});

  @override
  Widget build(BuildContext context) {
    return _CupertinoNotesDeleteDialogModel(
      onDelete: onDelete,
    );
  }
}

class _CupertinoNotesDeleteDialogModel extends StatelessWidget {
  const _CupertinoNotesDeleteDialogModel({required this.onDelete});

  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Delete Note?'),
      content: const Text('Are you sure you want to delete this note?'),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            onDelete();
            Navigator.of(context).pop();
          },
          child: const Text('Yes'),
        ),
        CupertinoDialogAction(
          onPressed: Navigator.of(context).pop,
          child: const Text('No'),
        ),
      ],
    );
  }
}

class _CupertinoNotesEditDialog extends NotesEditDialog {
  const _CupertinoNotesEditDialog(
      {required super.onNoteAccepted, required super.topText, super.noteData});

  @override
  State<StatefulWidget> createState() => _CupertinoNotesEditDialogState();
}

class _CupertinoNotesEditDialogState extends State<_CupertinoNotesEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late final _titleController =
      TextEditingController(text: widget.noteData?.title);
  late final _contentController =
      TextEditingController(text: widget.noteData?.content);
  final _titleFocusNode = FocusNode();

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _titleFocusNode.requestFocus();
    return _CupertinoNotesEditDialogModel(
      formKey: _formKey,
      topText: widget.topText,
      titleFocusNode: _titleFocusNode,
      titleController: _titleController,
      contentController: _contentController,
      onCancel: Navigator.of(context).pop,
      onFinish: () {
        if (_formKey.currentState?.validate() ?? false) {
          widget.onNoteAccepted(
            NoteData(
              content: _contentController.text,
              title: _titleController.text,
            ),
          );
          Navigator.of(context).pop();
        }
      },
    );
  }
}

class _CupertinoNotesEditDialogModel extends StatelessWidget {
  const _CupertinoNotesEditDialogModel(
      {required this.formKey,
      required this.topText,
      required this.titleFocusNode,
      required this.titleController,
      required this.contentController,
      required this.onCancel,
      required this.onFinish});

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
              minLines: 11,
              maxLines: 11,
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
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: onFinish,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
