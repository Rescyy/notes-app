import 'package:assignment_2/notes_database/dataclass.dart';
import 'package:assignment_2/notes_dialog/abstract/edit.dart';
import 'package:assignment_2/notes_dialog/material/models/edit.dart';
import 'package:flutter/material.dart';

class MaterialNotesEditDialog extends NotesEditDialog {
  const MaterialNotesEditDialog({super.key, 
    required super.onNoteAccepted,
    required super.topText,
    super.noteData,
  });

  const MaterialNotesEditDialog.edit({
    super.key,
    required super.onNoteAccepted,
    super.noteData,
  }) : super.edit();

  const MaterialNotesEditDialog.add({
    super.key,
    required super.onNoteAccepted,
    super.noteData,
  }) : super.add();

  @override
  State<MaterialNotesEditDialog> createState() =>
      MaterialNotesEditDialogState();
}

class MaterialNotesEditDialogState extends State<MaterialNotesEditDialog> {
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
    return MaterialNotesEditDialogModel(
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