import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_dialog/factory.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/material/dialog.dart' as material_dialog;

class MaterialNotesDialogFactory extends NotesDialogFactory {
  const MaterialNotesDialogFactory();
  @override
  NotesDeleteDialog createDeleteDialog({required void Function() onDelete}) {
    return _MaterialNotesDeleteDialog(
      onDelete: onDelete,
      warning: 'Are you sure you want to delete this note?',
      topText: 'Delete Note?',
    );
  }

  @override
  NotesEditDialog createEditDialog({
    required void Function(NoteData) onNoteAccepted,
    NoteData? noteData,
  }) {
    return _MaterialNotesEditDialog(
        onNoteAccepted: onNoteAccepted,
        topText: "New Note",
        noteData: noteData);
  }

  @override
  NotesEditDialog createAddDialog({
    required void Function(NoteData p1) onNoteAccepted,
    NoteData? noteData,
  }) {
    return _MaterialNotesEditDialog(
        onNoteAccepted: onNoteAccepted,
        topText: "Edit Note",
        noteData: noteData);
  }

  @override
  void showDialog({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
  }) {
    material_dialog.showDialog<void>(
      context: context,
      builder: builder,
    );
  }

  @override
  NotesDeleteDialog createMultipleDeleteDialog(
      {required void Function() onDelete, required int amount}) {
    return _MaterialNotesDeleteDialog(
      onDelete: onDelete,
      warning: "Are you sure you want to\ndelete $amount ${amount > 1 ? "notes" : "note"}?",
      topText: 'Delete notes?',
    );
  }
}

class _MaterialNotesEditDialogModel extends StatelessWidget {
  const _MaterialNotesEditDialogModel(
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
    // return empty container
    return Dialog(
      backgroundColor: NotesPallette.dialogBackground,
      child: Form(
        key: formKey,
        child: SizedBox(
          height: 450,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    topText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                TextFormField(
                  focusNode: titleFocusNode,
                  controller: titleController,
                  maxLength: 30,
                  cursorWidth: 1.5,
                  style: const TextStyle(fontSize: 15),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title Field is Required';
                    }
                    return null;
                  },
                  minLines: 1,
                  cursorColor: NotesPallette.buttonTextDark,
                  cursorErrorColor: NotesPallette.buttonTextDark,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: NotesPallette.note,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Title',
                  ),
                ),
                const Spacer(),
                TextFormField(
                  controller: contentController,
                  maxLength: 200,
                  maxLines: 7,
                  minLines: 7,
                  cursorWidth: 1.5,
                  style: const TextStyle(fontSize: 15),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Content Field is Required';
                    }
                    return null;
                  },
                  cursorColor: NotesPallette.buttonTextDark,
                  cursorErrorColor: NotesPallette.buttonTextDark,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: NotesPallette.note,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Content...',
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          NotesPallette.note,
                        ),
                        foregroundColor: WidgetStatePropertyAll(
                          NotesPallette.buttonTextDark,
                        ),
                        overlayColor: WidgetStatePropertyAll(
                          NotesPallette.splashColor,
                        ),
                      ),
                      onPressed: onCancel,
                      child: const Text('Cancel'),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          NotesPallette.floatingButton,
                        ),
                        foregroundColor: WidgetStatePropertyAll(
                          NotesPallette.buttonTextDark,
                        ),
                        overlayColor: WidgetStatePropertyAll(
                          NotesPallette.splashColor,
                        ),
                      ),
                      onPressed: onFinish,
                      child: const Text('Finish'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MaterialNotesEditDialog extends NotesEditDialog {
  const _MaterialNotesEditDialog({
    required super.onNoteAccepted,
    required super.topText,
    super.noteData,
  });

  @override
  State<_MaterialNotesEditDialog> createState() =>
      _MaterialNotesEditDialogState();
}

class _MaterialNotesEditDialogState extends State<_MaterialNotesEditDialog> {
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
    return _MaterialNotesEditDialogModel(
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

class _MaterialNotesDeleteDialogModel extends StatelessWidget {
  const _MaterialNotesDeleteDialogModel({
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

class _MaterialNotesDeleteDialog extends NotesDeleteDialog {
  const _MaterialNotesDeleteDialog({
    required super.onDelete,
    required super.warning,
    required super.topText,
  });

  @override
  Widget build(BuildContext context) {
    return _MaterialNotesDeleteDialogModel(
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
