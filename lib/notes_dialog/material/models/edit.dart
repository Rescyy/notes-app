import 'package:assignment_2/notes_pallette.dart';
import 'package:flutter/material.dart';

class MaterialNotesEditDialogModel extends StatelessWidget {
  const MaterialNotesEditDialogModel(
      {super.key, required this.formKey,
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