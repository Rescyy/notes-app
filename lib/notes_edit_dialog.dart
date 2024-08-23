import 'package:assignment_2/notes_database.dart';
import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';

class NotesEditDialog extends StatefulWidget {
  const NotesEditDialog({
    super.key,
    required this.onNoteAccepted,
    this.title,
    this.content,
    required this.titleText,
  });

  final void Function(NoteData) onNoteAccepted;
  final String? title;
  final String? content;
  final String titleText;

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
    return Dialog(
      backgroundColor: NotesPallette.dialogBackground,
      child: Form(
        key: _formKey,
        child: SizedBox(
          height: 450,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.titleText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                TextFormField(
                  focusNode: _titleFocusNode,
                  controller: _titleController,
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
                  controller: _contentController,
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
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
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.of(context).pop();
                          widget.onNoteAccepted(
                            NoteData(
                              content: _contentController.text,
                              title: _titleController.text,
                            ),
                          );
                        }
                      },
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
