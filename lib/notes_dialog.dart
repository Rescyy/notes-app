import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';

class _NotesEditDialogModel extends StatelessWidget {
  const _NotesEditDialogModel(
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

class NotesEditDialog extends StatefulWidget {
  const NotesEditDialog({
    super.key,
    required this.onNoteAccepted,
    this.title,
    this.content,
    required this.topText,
  });

  final void Function(NoteData) onNoteAccepted;
  final String? title;
  final String? content;
  final String topText;

  @override
  State<NotesEditDialog> createState() => _NotesEditDialogState();
}

class _NotesEditDialogState extends State<NotesEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late final _titleController = TextEditingController(text: widget.title);
  late final _contentController = TextEditingController(text: widget.content);
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
    return _NotesEditDialogModel(
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

class _NotesDeleteDialogModel extends StatelessWidget {
  const _NotesDeleteDialogModel({
    required this.onDelete,
    required this.onCancel,
  });

  final void Function() onDelete;
  final void Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Note'),
      content: const Text('Are you sure you want to delete this note?'),
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

class NotesDeleteDialog extends StatelessWidget {
  const NotesDeleteDialog({super.key, required this.onDelete});

  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return _NotesDeleteDialogModel(
      onDelete: () {
        onDelete();
        Navigator.of(context).pop();
      },
      onCancel: Navigator.of(context).pop,
    );
  }
}
